import 'package:qr_parser/src/data/schemes.dart';
import '../../data/qr_types.dart';
import '../../utils/base_qr.dart';
import 'package:qr_parser/src/data/qr_types.dart';

class QrSmsTo extends BaseQrModel {
  const QrSmsTo({required super.rawData, required String phone, String? text});

  @override
  QrTypes get type => QrTypes.smsto;

  factory QrSmsTo.fromRawData({required String rawData}) {
    final smsToUri = Uri.parse(rawData);
    if (smsToUri.scheme != Schemes.smsToScheme) {
      throw Exception('This is not smsTo scheme');
    }

    final smsToUriPath = smsToUri.path;

    final firstDividerIndex = smsToUriPath.indexOf(':');
    final phone = smsToUriPath.substring(0, firstDividerIndex);
    final text =
        smsToUriPath.substring(firstDividerIndex + 1, smsToUri.path.length);

    return QrSmsTo(rawData: rawData, phone: phone, text: text);
  }
}
