import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_plc_identifiers.freezed.dart';
part 'user_plc_identifiers.g.dart';

/// Cached user's PLC identifiers for offline access.
///
/// Stores the list of PLC identifiers that a user has access to,
/// enabling offline operation when Firestore is unavailable.
@freezed
abstract class UserPlcIdentifiers with _$UserPlcIdentifiers {
  /// Creates user PLC identifiers.
  const factory UserPlcIdentifiers({
    /// User ID who owns these identifiers.
    required String userId,

    /// List of PLC identifiers the user has access to.
    required List<String> identifiers,

    /// Timestamp when the identifiers were cached.
    required DateTime cachedAt,
  }) = _UserPlcIdentifiers;

  /// Creates [UserPlcIdentifiers] from JSON map.
  factory UserPlcIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$UserPlcIdentifiersFromJson(json);
}
