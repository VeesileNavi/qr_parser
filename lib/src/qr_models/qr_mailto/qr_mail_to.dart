import 'package:qr_parser/src/data/schemes.dart';
import 'package:qr_parser/src/data/qr_types.dart';
import '../../data/qr_types.dart';
import '../../utils/base_qr.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../../utils/launcher.dart';

class QrMailTo extends BaseQrModel with Launcher{
  const QrMailTo._(
      {required super.rawData,
      required this.email,
      required this.subject,
      required this.body});

  final String email;
  final String subject;
  final String body;

  @override
  QrType get type => QrType.mailto;

  factory QrMailTo.fromRawData({required String rawData}) {
    final mailtoUri = Uri.parse(rawData);

    if (mailtoUri.scheme != Schemes.mailToScheme) {
      throw Exception('This is not mailTo url');
    }

    return QrMailTo._(
      rawData: rawData,
      email: mailtoUri.path,
      subject: mailtoUri.queryParameters['subject'] ?? '',
      body: mailtoUri.queryParameters['body'] ?? '',
    );
  }

  @override
  void launch() async {
    final uri = Uri.parse(rawData);
    if (await url_launcher.canLaunchUrl(uri)) {
      url_launcher.launchUrl(Uri.parse(rawData));
    } else {
      throw Exception('Cannot launch mailto url');
    }
  }
}
