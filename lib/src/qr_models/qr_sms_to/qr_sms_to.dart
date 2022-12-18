import 'package:qr_parser/src/data/schemes.dart';
import '../../data/qr_types.dart';
import '../../utils/base_qr.dart';
import 'package:qr_parser/src/data/qr_types.dart';

///This model contains all the necessary information about the sms-sending url transmitted in the qr-code
class QrSmsTo extends BaseQrModel{
  const QrSmsTo._({required super.rawData, required this.phone, this.text});
final String phone;
final String? text;
  @override
  QrType get type => QrType.smsto;

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

    return QrSmsTo._(rawData: rawData, phone: phone, text: text);
  }
}
