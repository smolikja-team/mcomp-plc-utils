import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

extension LaunchUri on Uri {
  static final _logging = Logger('LaunchUri');

  /// Launches the URL in the default browser.
  Future<void> launchInBrowser() async {
    if (!await launchUrl(this)) {
      _logging.severe('Could not launch $this');
    }
  }
}
