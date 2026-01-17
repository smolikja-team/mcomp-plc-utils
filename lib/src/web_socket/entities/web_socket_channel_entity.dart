import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'web_socket_channel_entity.freezed.dart';

@freezed
abstract class WebSocketChannelEntity with _$WebSocketChannelEntity {
  const factory WebSocketChannelEntity({
    required String plcId,
    required String address,
    required WebSocketChannel channel,
  }) = _WebSocketChannelEntity;
}
