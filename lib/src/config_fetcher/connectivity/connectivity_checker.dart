/// Abstract interface for checking network connectivity.
///
/// Implementations provide a way to check if the device has network access,
/// enabling the caching layer to decide between fetching from network
/// or returning cached data.
///
/// The default implementation is `NetworkConnectivityChecker` which uses
/// the `connectivity_plus` package.
abstract class ConnectivityChecker {
  /// Checks if the device currently has network connectivity.
  ///
  /// Returns `true` if any network connection (WiFi, mobile, etc.) is available.
  /// Returns `false` if the device is offline.
  Future<bool> hasConnectivity();
}
