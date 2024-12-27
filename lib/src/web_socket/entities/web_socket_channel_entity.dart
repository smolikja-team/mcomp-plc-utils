import 'package:equatable/equatable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketChannelEntity extends Equatable {
  const WebSocketChannelEntity({
    required this.plcId,
    required this.address,
    required this.channel,
  });

  final String plcId;
  final String address;
  final WebSocketChannel channel;

  @override
  List<Object?> get props => [plcId, address, channel];
}
