import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_message_bo.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_messgae_payload_bo.dart';
import 'package:mcomp_plc_utils/src/web_socket/entities/web_socket_channel_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketController {
  factory WebSocketController() {
    return _webSocketController;
  }

  WebSocketController._internal();

  static const _kWssProtocols = ['devs'];
  static const _kWssUpdateBody = '{"intent": "list"}';
  static const _kWssAddressPrefix = 'wss://';

  static final WebSocketController _webSocketController =
      WebSocketController._internal();

  final List<WebSocketChannelEntity> _openedChannels = [];
  List<WebSocketChannel> get channels =>
      _openedChannels.map((channel) => channel.channel).toList();

  final _logger = Logger('WebSocketController');

  // MARK: - Connection

  /// Connect to WebSocket
  /// - Parameters:
  /// - plcId: PLC identifier
  /// - address: WebSocket address
  void connect({required String plcId, required String address}) {
    if (_openedChannels.any((channel) => channel.plcId == plcId)) {
      _logger.warning(
        'WebSocket for $plcId, address: $address is already connected',
      );
      return;
    }

    try {
      final channel = WebSocketChannel.connect(
        Uri.parse(_kWssAddressPrefix + address),
        protocols: _kWssProtocols,
      );
      _openedChannels.add(
        WebSocketChannelEntity(
          plcId: plcId,
          address: address,
          channel: channel,
        ),
      );
      channel.sink.add(_kWssUpdateBody);
      _logger.info('WebSocket connected to $plcId, address: $address');
    } catch (e) {
      _logger.severe(
        'WebSocket connection to $plcId, address: $address error: $e',
      );
    }
  }

  /// Connect to multiple WebSocket
  /// - Parameters:
  /// - connections: List of PLC IP and WebSocket address
  void connectAll(List<({String plcIp, String address})> connections) {
    for (final connection in connections) {
      connect(plcId: connection.plcIp, address: connection.address);
    }
  }

  // MARK: - Disconnection

  /// Disconnect WebSocket
  /// - Parameters:
  /// - plcId: PLC identifier
  void disconnect(String plcId) {
    try {
      final channel = _openedChannels.firstWhere(
        (channel) => channel.plcId == plcId,
      );
      _disconnectChannel(channel);
    } catch (e) {
      _logger.severe(
        'WebSocket for $plcId is not connected and tries to disconnect, error: $e',
      );
    }
  }

  /// Disconnect all WebSocket
  void disconnectAll() {
    print(_openedChannels);
    for (final channel in _openedChannels) {
      print(channel);
      _disconnectChannel(channel);
    }
    print('dine');
  }

  /// Disconnect WebSocket channel
  /// - Parameters:
  /// - channel: WebSocket channel
  void _disconnectChannel(WebSocketChannelEntity channel) {
    try {
      channel.channel.sink.close();
      _openedChannels.remove(channel);
      _logger.info('WebSocked disconnected ${channel.address}');
    } catch (e) {
      _logger.severe('WebSocket disconnect ${channel.address}, error: $e');
    }
  }

  // MARK: - Sending messages

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

  /// Send message to WebSocket
  /// - Parameters:
  /// - plcId: PLC identifier
  /// - message: Message to send
  void sendMessage({
    required String plcId,
    required String message,
  }) {
    try {
      final channel =
          _openedChannels.firstWhere((channel) => channel.plcId == plcId);
      channel.channel.sink.add(message);
    } catch (e) {
      _logger.severe('Error sending message to $plcId, error: $e');
    }
  }
}
