import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logging/logging.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/connectivity/connectivity_checker.dart';

/// Network-based implementation of [ConnectivityChecker] with real internet
/// reachability verification.
///
/// First checks if device is connected to a network (WiFi, mobile, etc.),
/// then verifies actual internet connectivity by making a quick HTTP request
/// to a reliable endpoint.
///
/// This prevents false positives when device is connected to WiFi but the
/// router has no internet access.
class NetworkConnectivityChecker implements ConnectivityChecker {
  /// Creates a network connectivity checker.
  ///
  /// [reachabilityTimeout] - timeout for the internet reachability check.
  /// Defaults to 5 seconds.
  const NetworkConnectivityChecker({
    this.reachabilityTimeout = const Duration(seconds: 5),
  });

  /// Timeout for the HTTP reachability check.
  final Duration reachabilityTimeout;

  /// URL to check for internet reachability.
  /// Using Google's generate_204 endpoint which is fast and reliable.
  static const String _reachabilityUrl = 'https://www.gstatic.com/generate_204';

  static final _log = Logger('NetworkConnectivityChecker');

  @override
  Future<bool> hasConnectivity() async {
    // Step 1: Check if device is connected to any network
    final results = await Connectivity().checkConnectivity();
    final hasNetworkInterface =
        results.any((result) => result != ConnectivityResult.none);

    if (!hasNetworkInterface) {
      return false;
    }

    // Step 2: Verify actual internet connectivity with HTTP request
    try {
      final client = HttpClient()..connectionTimeout = reachabilityTimeout;

      final request = await client.getUrl(Uri.parse(_reachabilityUrl));
      final response = await request.close().timeout(reachabilityTimeout);

      // Drain the response to prevent resource leaks
      await response.drain<void>();

      return response.statusCode == 204 || response.statusCode == 200;
    } on TimeoutException {
      _log.warning('Internet reachability check timed out');
      return false;
    } on SocketException catch (e) {
      _log.warning('Internet reachability check failed: $e');
      return false;
    } catch (e) {
      _log.warning('Internet reachability check error: $e');
      return false;
    }
  }
}
