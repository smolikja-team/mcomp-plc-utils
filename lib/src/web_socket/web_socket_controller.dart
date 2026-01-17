import 'dart:async'
    show Completer, StreamController, StreamSubscription, Timer, unawaited;
import 'dart:convert';
import 'dart:math' show min, pow;

import 'package:logging/logging.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_get_message_bo.dart'
    show WsGetMessageBO;
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_message_bo.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_message_payload_bo.dart';
import 'package:mcomp_plc_utils/src/web_socket/entities/plc_addresses.dart';
import 'package:mcomp_plc_utils/src/web_socket/entities/web_socket_channel_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum ConnectionStatus { connected, connecting, disconnected, error }

class WebSocketController {
  /// Creates a WebSocketController.
  /// - [localConnectionTimeoutMs]: Timeout in milliseconds for local network
  ///   connection before falling back to public. Default: 1000ms (1 second).
  WebSocketController({this.localConnectionTimeoutMs = 1000});

  static const _kWssProtocols = ['devs'];
  static const _kWssUpdateBody = '{"intent": "list"}';
  static const _kWssAddressPrefix = 'wss://';
  static const _kMaxReconnectDelaySeconds = 30;

  /// Timeout in milliseconds for local network connection attempts.
  final int localConnectionTimeoutMs;

  final _logger = Logger('WebSocketController');

  // Stream for all messages from all PLCs
  final _messageController =
      StreamController<({String plcId, dynamic data})>.broadcast();
  Stream<({String plcId, dynamic data})> get messages =>
      _messageController.stream;

  // Stream for connection statuses
  final _statusController =
      StreamController<({String plcId, ConnectionStatus status})>.broadcast();
  Stream<({String plcId, ConnectionStatus status})> get statusStream =>
      _statusController.stream;

  // Internal state
  final Map<String, WebSocketChannel> _channels = {};
  final Map<String, StreamSubscription<dynamic>> _subscriptions = {};
  final Map<String, Timer> _reconnectTimers = {};
  final Map<String, PlcAddresses> _addresses = {};
  final Map<String, int> _reconnectAttempts = {};
  final Map<String, ConnectionType> _connectionTypes = {};

  List<WebSocketChannelEntity> get channels => _channels.entries
      .map(
        (e) => WebSocketChannelEntity(
          plcId: e.key,
          address: _addresses[e.key]?.publicAddress ?? '',
          channel: e.value,
          connectionType: _connectionTypes[e.key] ?? ConnectionType.public,
        ),
      )
      .toList();

  // MARK: - Connection

  /// Connect to WebSocket
  /// - Parameters:
  /// - plcId: PLC identifier
  /// - localAddress: Optional local network address (prioritized)
  /// - publicAddress: Public internet address (fallback)
  void connect({
    required String plcId,
    String? localAddress,
    required String publicAddress,
  }) {
    if (_channels.containsKey(plcId)) {
      _logger.warning('WebSocket for $plcId is already connected');
      return;
    }

    final addresses = PlcAddresses(
      localAddress: localAddress,
      publicAddress: publicAddress,
    );
    _addresses[plcId] = addresses;
    _reconnectAttempts[plcId] = 0;
    _connectWithRace(plcId, addresses);
  }

  /// Internal method to attempt connection with parallel race strategy.
  /// If localAddress is provided, both connections are attempted simultaneously.
  /// The first successful connection wins, the other is cancelled.
  Future<void> _connectWithRace(String plcId, PlcAddresses addresses) async {
    _updateStatus(plcId, ConnectionStatus.connecting);

    // If no local address, connect directly via public
    if (addresses.localAddress == null) {
      await _attemptSingleConnection(
        plcId,
        addresses.publicAddress,
        ConnectionType.public,
      );
      return;
    }

    // Parallel race: try both connections simultaneously
    final completer =
        Completer<({WebSocketChannel channel, ConnectionType type})>();
    WebSocketChannel? localChannel;
    WebSocketChannel? publicChannel;
    var localDone = false;
    var publicDone = false;

    // Attempt local connection
    unawaited(
      _attemptRaceConnection(addresses.localAddress!)
          .then((channel) {
            localChannel = channel;
            localDone = true;
            if (!completer.isCompleted && channel != null) {
              completer.complete((
                channel: channel,
                type: ConnectionType.local,
              ));
            }
          })
          .catchError((Object e) {
            localDone = true;
            _logger.fine('Local connection failed for $plcId: $e');
            // If public also failed, complete with error
            if (publicDone && !completer.isCompleted) {
              completer.completeError(e);
            }
          }),
    );

    // Attempt public connection
    unawaited(
      _attemptRaceConnection(addresses.publicAddress)
          .then((channel) {
            publicChannel = channel;
            publicDone = true;
            if (!completer.isCompleted && channel != null) {
              // Only complete with public if local hasn't won yet
              // Give local a slight priority window
              unawaited(
                Future.delayed(
                  Duration(milliseconds: localConnectionTimeoutMs),
                  () {
                    if (!completer.isCompleted) {
                      completer.complete((
                        channel: channel,
                        type: ConnectionType.public,
                      ));
                    }
                  },
                ),
              );
            }
          })
          .catchError((Object e) {
            publicDone = true;
            _logger.warning('Public connection failed for $plcId: $e');
            // If local also failed, complete with error
            if (localDone && !completer.isCompleted) {
              completer.completeError(e);
            }
          }),
    );

    // Also set a timeout for local to ensure public can win if local is slow
    unawaited(
      Future.delayed(Duration(milliseconds: localConnectionTimeoutMs), () {
        if (!completer.isCompleted && publicChannel != null) {
          completer.complete((
            channel: publicChannel!,
            type: ConnectionType.public,
          ));
        }
      }),
    );

    try {
      final result = await completer.future;

      // Close the losing connection
      if (result.type == ConnectionType.local) {
        unawaited(publicChannel?.sink.close());
        _logger.info('Using local connection for $plcId');
      } else {
        unawaited(localChannel?.sink.close());
        _logger.info('Using public connection for $plcId');
      }

      // Finalize the winning connection
      await _finalizeConnection(plcId, result.channel, result.type);
    } catch (e) {
      _logger.severe('All connections failed for $plcId: $e');
      _channels.remove(plcId);
      _updateStatus(plcId, ConnectionStatus.error);
      _scheduleReconnect(plcId);
    }
  }

  /// Attempts a single connection for race. Returns channel or null on failure.
  Future<WebSocketChannel?> _attemptRaceConnection(String address) async {
    try {
      final channel = WebSocketChannel.connect(
        Uri.parse(_kWssAddressPrefix + address),
        protocols: _kWssProtocols,
      );
      await channel.ready;
      return channel;
    } catch (e) {
      return null;
    }
  }

  /// Attempts a single connection (used when no local address is provided)
  Future<void> _attemptSingleConnection(
    String plcId,
    String address,
    ConnectionType type,
  ) async {
    try {
      final channel = WebSocketChannel.connect(
        Uri.parse(_kWssAddressPrefix + address),
        protocols: _kWssProtocols,
      );
      await channel.ready;
      await _finalizeConnection(plcId, channel, type);
    } on WebSocketChannelException catch (e) {
      _logger.severe(
        'WebSocket channel exception for $plcId, address: $address: $e',
      );
      _channels.remove(plcId);
      _updateStatus(plcId, ConnectionStatus.error);
      _scheduleReconnect(plcId);
    } catch (e) {
      _logger.severe(
        'WebSocket connection to $plcId, address: $address error: $e',
      );
      _channels.remove(plcId);
      _updateStatus(plcId, ConnectionStatus.error);
      _scheduleReconnect(plcId);
    }
  }

  /// Finalizes a successful connection - sets up listeners and updates state
  Future<void> _finalizeConnection(
    String plcId,
    WebSocketChannel channel,
    ConnectionType type,
  ) async {
    _channels[plcId] = channel;
    _connectionTypes[plcId] = type;

    // Reset reconnect attempts on successful connection
    _reconnectAttempts[plcId] = 0;

    // Initial handshake
    channel.sink.add(_kWssUpdateBody);
    _updateStatus(plcId, ConnectionStatus.connected);

    final address = type == ConnectionType.local
        ? _addresses[plcId]?.localAddress
        : _addresses[plcId]?.publicAddress;
    _logger.info(
      'WebSocket connected to $plcId via ${type.name}, address: $address',
    );

    // Listen to messages and store subscription for proper cleanup
    _subscriptions[plcId] = channel.stream.listen(
      (data) {
        _messageController.add((plcId: plcId, data: data));
      },
      onError: (Object error) {
        _logger.warning('WebSocket error from $plcId: $error');
        _updateStatus(plcId, ConnectionStatus.error);
        _scheduleReconnect(plcId);
      },
      onDone: () {
        _logger.warning('WebSocket connection to $plcId closed');
        _updateStatus(plcId, ConnectionStatus.disconnected);
        _scheduleReconnect(plcId);
      },
      cancelOnError: true,
    );
  }

  /// Calculate reconnect delay with exponential backoff
  int _getReconnectDelaySeconds(String plcId) {
    final attempts = _reconnectAttempts[plcId] ?? 0;
    return min(_kMaxReconnectDelaySeconds, pow(2, attempts).toInt());
  }

  void _scheduleReconnect(String plcId) {
    // Cleanup old channel and subscription references
    _channels.remove(plcId);
    _connectionTypes.remove(plcId);
    _subscriptions[plcId]?.cancel();
    _subscriptions.remove(plcId);

    if (_reconnectTimers.containsKey(plcId)) return; // Already scheduled

    // Increment reconnect attempts for exponential backoff
    _reconnectAttempts[plcId] = (_reconnectAttempts[plcId] ?? 0) + 1;
    final delaySeconds = _getReconnectDelaySeconds(plcId);

    _logger.info('Scheduling reconnect for $plcId in $delaySeconds seconds...');
    _reconnectTimers[plcId] = Timer(Duration(seconds: delaySeconds), () {
      _reconnectTimers.remove(plcId);
      final addresses = _addresses[plcId];
      if (addresses != null) {
        // Always try local first on reconnect (if available)
        _connectWithRace(plcId, addresses);
      }
    });
  }

  /// Connect to multiple WebSocket
  /// - Parameters:
  /// - connections: List of PLC connections with local and public addresses
  void connectAll(
    List<({String plcId, String? localAddress, String publicAddress})>
    connections,
  ) {
    for (final connection in connections) {
      connect(
        plcId: connection.plcId,
        localAddress: connection.localAddress,
        publicAddress: connection.publicAddress,
      );
    }
  }

  // MARK: - Disconnection

  /// Disconnect WebSocket
  /// - Parameters:
  /// - plcId: PLC identifier
  void disconnect(String plcId) {
    _reconnectTimers[plcId]?.cancel();
    _reconnectTimers.remove(plcId);
    _reconnectAttempts.remove(plcId);

    _subscriptions[plcId]?.cancel();
    _subscriptions.remove(plcId);

    final channel = _channels.remove(plcId);
    if (channel != null) {
      _disconnectChannel(channel, plcId);
    }
    _addresses.remove(plcId);
    _connectionTypes.remove(plcId);
  }

  /// Disconnect all WebSocket
  void disconnectAll() {
    for (final timer in _reconnectTimers.values) {
      timer.cancel();
    }
    _reconnectTimers.clear();
    _reconnectAttempts.clear();

    for (final subscription in _subscriptions.values) {
      subscription.cancel();
    }
    _subscriptions.clear();

    for (final entry in _channels.entries) {
      _disconnectChannel(entry.value, entry.key);
    }
    _channels.clear();
    _addresses.clear();
    _connectionTypes.clear();
  }

  void _disconnectChannel(WebSocketChannel channel, String plcId) {
    try {
      channel.sink.close();
      _logger.info('WebSocket for $plcId disconnected');
    } catch (e) {
      _logger.severe('WebSocket for $plcId disconnect error: $e');
    }
  }

  void dispose() {
    disconnectAll();
    _messageController.close();
    _statusController.close();
  }

  void _updateStatus(String plcId, ConnectionStatus status) {
    _statusController.add((plcId: plcId, status: status));
  }

  // MARK: - Sending messages

  /// Request State Update
  /// - Parameters:
  /// - plcId: PLC identifier
  /// - deviceIds: List of device identifiers
  void requestStateUpdate({
    required String plcId,
    required List<String> deviceIds,
  }) {
    final message = jsonEncode(WsGetMessageBO(payload: deviceIds));
    _logger.info(
      'Requesting state update of devices: $deviceIds, on PLC: $plcId',
    );
    sendMessage(plcId: plcId, message: message);
  }

  /// Update device
  /// - Parameters:
  /// - plcId: PLC identifier
  /// - deviceId: Device identifier
  /// - update: Update properties
  void updateDevice({
    required String plcId,
    required String deviceId,
    required Map<String, dynamic> update,
  }) {
    final message = jsonEncode(
      WsSetMessageBO(
        payload: [WsSetMessagePayloadBO(id: deviceId, update: update)],
      ),
    );
    sendMessage(plcId: plcId, message: message);
  }

  /// Update devices
  /// - Parameters:
  /// - plcId: PLC identifier
  /// - update: List of device identifiers and their update data
  void updateDevices(
    String plcId,
    List<({String deviceId, Map<String, dynamic> update})> update,
  ) {
    final message = jsonEncode(
      WsSetMessageBO(
        payload: update
            .map(
              (item) =>
                  WsSetMessagePayloadBO(id: item.deviceId, update: item.update),
            )
            .toList(),
      ),
    );
    sendMessage(plcId: plcId, message: message);
  }

  /// Send message to WebSocket
  /// - Parameters:
  /// - plcId: PLC identifier
  /// - message: Message to send
  void sendMessage({required String plcId, required String message}) {
    try {
      final channel = _channels[plcId];
      if (channel != null) {
        channel.sink.add(message);
      } else {
        _logger.warning(
          'Cannot send message: WebSocket for $plcId not connected',
        );
      }
    } catch (e) {
      _logger.severe('Error sending message to $plcId, error: $e');
    }
  }
}
