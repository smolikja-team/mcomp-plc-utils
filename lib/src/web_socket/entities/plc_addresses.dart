import 'package:freezed_annotation/freezed_annotation.dart';

part 'plc_addresses.freezed.dart';

/// Holds both local network and public internet addresses for a PLC.
/// - [localAddress]: Optional address within local network (prioritized)
/// - [publicAddress]: Public internet address (fallback)
@freezed
abstract class PlcAddresses with _$PlcAddresses {
  const factory PlcAddresses({
    String? localAddress,
    required String publicAddress,
  }) = _PlcAddresses;
}
