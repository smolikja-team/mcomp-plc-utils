import 'dart:async';
import 'dart:convert';
import 'dart:math' show min, pow;

import 'package:logging/logging.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_get_message_bo.dart'
    show WsGetMessageBO;
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_message_bo.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_message_payload_bo.dart';
import 'package:mcomp_plc_utils/src/web_socket/entities/web_socket_channel_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum ConnectionStatus { connected, connecting, disconnected, error }

class WebSocketController {
  WebSocketController();

  static const _kWssProtocols = ['devs'];
  static const _kWssUpdateBody = '{"intent": "list"}';
  static const _kWssAddressPrefix = 'wss://';
  static const _kMaxReconnectDelaySeconds = 30;

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
  final Map<String, String> _addresses = {};
  final Map<String, int> _reconnectAttempts = {};

  List<WebSocketChannelEntity> get channels => _channels.entries
      .map(
        (e) => WebSocketChannelEntity(
          plcId: e.key,
          address: _addresses[e.key] ?? '',
          channel: e.value,
        ),
      )
      .toList();

  // MARK: - Connection

  /// Connect to WebSocket
  /// - Parameters:
  /// - plcId: PLC identifier
  /// - address: WebSocket address
  void connect({required String plcId, required String address}) {
    if (_channels.containsKey(plcId)) {
      _logger.warning(
        'WebSocket for $plcId, address: $address is already connected',
      );
      return;
    }

    _addresses[plcId] = address;
    _reconnectAttempts[plcId] = 0;
    _connectToPlc(plcId, address);
  }

  Future<void> _connectToPlc(String plcId, String address) async {
    _updateStatus(plcId, ConnectionStatus.connecting);

    try {
      final channel = WebSocketChannel.connect(
        Uri.parse(_kWssAddressPrefix + address),
        protocols: _kWssProtocols,
      );

      _channels[plcId] = channel;

      // Wait for WebSocket to be ready before sending messages
      await channel.ready;

      // Reset reconnect attempts on successful connection
      _reconnectAttempts[plcId] = 0;

      // Initial handshake
      channel.sink.add(_kWssUpdateBody);
      _updateStatus(plcId, ConnectionStatus.connected);
      _logger.info('WebSocket connected to $plcId, address: $address');

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

  /// Calculate reconnect delay with exponential backoff
  int _getReconnectDelaySeconds(String plcId) {
    final attempts = _reconnectAttempts[plcId] ?? 0;
    return min(_kMaxReconnectDelaySeconds, pow(2, attempts).toInt());
  }

  void _scheduleReconnect(String plcId) {
    // Cleanup old channel and subscription references
    _channels.remove(plcId);
    _subscriptions[plcId]?.cancel();
    _subscriptions.remove(plcId);

    if (_reconnectTimers.containsKey(plcId)) return; // Already scheduled

    // Increment reconnect attempts for exponential backoff
    _reconnectAttempts[plcId] = (_reconnectAttempts[plcId] ?? 0) + 1;
    final delaySeconds = _getReconnectDelaySeconds(plcId);

    _logger.info('Scheduling reconnect for $plcId in $delaySeconds seconds...');
    _reconnectTimers[plcId] = Timer(Duration(seconds: delaySeconds), () {
      _reconnectTimers.remove(plcId);
      final address = _addresses[plcId];
      if (address != null) {
        _connectToPlc(plcId, address);
      }
    });
  }

  /// Connect to multiple WebSocket
  /// - Parameters:
  /// - connections: List of PLC IP and WebSocket address
  void connectAll(List<({String plcId, String address})> connections) {
    for (final connection in connections) {
      connect(plcId: connection.plcId, address: connection.address);
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
    final message = jsonEncode(
      WsGetMessageBO(payload: deviceIds),
    );
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
              (item) => WsSetMessagePayloadBO(
                id: item.deviceId,
                update: item.update,
              ),
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
  void sendMessage({
    required String plcId,
    required String message,
  }) {
    try {
      final channel = _channels[plcId];
      if (channel != null) {
        channel.sink.add(message);
      } else {
        _logger
            .warning('Cannot send message: WebSocket for $plcId not connected');
      }
    } catch (e) {
      _logger.severe('Error sending message to $plcId, error: $e');
    }
  }
}
