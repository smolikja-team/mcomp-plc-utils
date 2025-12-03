import 'dart:async';
import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_get_message_bo.dart'
    show WsGetMessageBO;
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_message_bo.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_messgae_payload_bo.dart';
import 'package:mcomp_plc_utils/src/web_socket/entities/web_socket_channel_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum ConnectionStatus { connected, connecting, disconnected, error }

class WebSocketController {
  WebSocketController();

  static const _kWssProtocols = ['devs'];
  static const _kWssUpdateBody = '{"intent": "list"}';
  static const _kWssAddressPrefix = 'wss://';

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
  final Map<String, Timer> _reconnectTimers = {};
  final Map<String, String> _addresses = {};

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
    _connectToPlc(plcId, address);
  }

  void _connectToPlc(String plcId, String address) {
    _updateStatus(plcId, ConnectionStatus.connecting);

    try {
      final channel = WebSocketChannel.connect(
        Uri.parse(_kWssAddressPrefix + address),
        protocols: _kWssProtocols,
      );

      _channels[plcId] = channel;

      // Initial handshake
      channel.sink.add(_kWssUpdateBody);
      _updateStatus(plcId, ConnectionStatus.connected);
      _logger.info('WebSocket connected to $plcId, address: $address');

      // Listen to messages
      channel.stream.listen(
        (data) {
          _messageController.add((plcId: plcId, data: data));
        },
        onError: (error) {
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
    } catch (e) {
      _logger.severe(
        'WebSocket connection to $plcId, address: $address error: $e',
      );
      _updateStatus(plcId, ConnectionStatus.error);
      _scheduleReconnect(plcId);
    }
  }

  void _scheduleReconnect(String plcId) {
    _channels.remove(plcId); // Cleanup old channel reference

    if (_reconnectTimers.containsKey(plcId)) return; // Already scheduled

    _logger.info('Scheduling reconnect for $plcId in 5 seconds...');
    _reconnectTimers[plcId] = Timer(const Duration(seconds: 5), () {
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
        payload: [WsSetMessgaePayloadBO(id: deviceId, update: update)],
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
              (item) => WsSetMessgaePayloadBO(
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
        _logger.warning('Cannot send message: WebSocket for $plcId not connected');
      }
    } catch (e) {
      _logger.severe('Error sending message to $plcId, error: $e');
    }
  }
}
