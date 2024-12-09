import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mailto/mailto.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailReporting {
  /// Date and time of reporting
  static String get _dateTime => DateTime.now().toIso8601String();

  /// App ID
  static Future<String> get _appID async =>
      (await PackageInfo.fromPlatform()).packageName;

  /// App version
  static Future<String> get _appVersion async =>
      (await PackageInfo.fromPlatform()).version;

  /// App build number
  static Future<String> get _appBuild async =>
      (await PackageInfo.fromPlatform()).buildNumber;

  /// App build scheme
  static String get _appBuildScheme => appFlavor ?? 'unknown';

  /// User ID
  static String get _userID =>
      FirebaseAuth.instance.currentUser?.uid ?? 'unknown';

  /// Platform
  static Future<String> get _platform async => defaultTargetPlatform.toString();

  /// Device
  static Future<String> get _device async {
    final deviceInfo = DeviceInfoPlugin();
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        final manufacturer = (await deviceInfo.androidInfo).manufacturer;
        final model = (await deviceInfo.androidInfo).model;
        return '$manufacturer $model';
      case TargetPlatform.iOS:
        final name = (await deviceInfo.iosInfo).name;
        final model = (await deviceInfo.iosInfo).model;
        return '$name $model';
      default:
        return 'unknown';
    }
  }

  /// Device OS
  static Future<String> get _deviceOS async {
    final deviceInfo = DeviceInfoPlugin();
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        final release = (await deviceInfo.androidInfo).version.release;
        final sdkInt = (await deviceInfo.androidInfo).version.sdkInt;
        return 'Android $release (SDK $sdkInt)';
      case TargetPlatform.iOS:
        final systemName = (await deviceInfo.iosInfo).systemName;
        final version = (await deviceInfo.iosInfo).systemVersion;
        return '$systemName $version';
      default:
        return 'unknown';
    }
  }

  /// All device info
  static Future<String> get _deviceInfo async =>
      (await DeviceInfoPlugin().deviceInfo).toString();

  /// Connectivity
  static Future<String> get _connectivity async =>
      (await Connectivity().checkConnectivity()).toString();

  /// Battery
  static Future<String> get _battery async =>
      (await Battery().batteryLevel).toString();

  static Future<String> _composeBody(Object error, StackTrace stack) async {
    return '''
      date time: $_dateTime
      
      app ID: ${await _appID}
      app version: ${await _appVersion}
      app build: ${await _appBuild}
      app build scheme: $_appBuildScheme
      
      user ID: $_userID
      platform: ${await _platform}
      device: ${await _device}
      device OS: ${await _deviceOS}
      all device info: ${await _deviceInfo}
      
      connectivity: ${await _connectivity}
      battery: ${await _battery}
      
      error: $error
      
      stack trace: $stack
      ''';
  }

  static Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> composeAnErrorEmail({
    required Object error,
    required StackTrace stack,
    required List<String> to,
    List<String>? cc,
  }) async {
    final mailtoLink = Mailto(
      to: to,
      cc: cc,
      subject: 'Application error reporting',
      body: await _composeBody(error, stack),
    );

    await _launchUrl(Uri.parse(mailtoLink.toString()));
  }
}
