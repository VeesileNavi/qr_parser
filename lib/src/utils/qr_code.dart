import 'package:qr_parser/src/data/qr_types.dart';
import 'package:qr_parser/src/data/schemes.dart';
import 'package:qr_parser/src/qr_models/qr_mailto/qr_mail_to.dart';
import 'package:qr_parser/src/qr_models/qr_phone/qr_phone.dart';
import 'package:qr_parser/src/qr_models/qr_sms_to/qr_sms_to.dart';
import 'package:qr_parser/src/qr_models/qr_text/qr_text.dart';
import 'package:qr_parser/src/qr_models/qr_wifi/qr_wifi.dart';
import 'package:qr_parser/src/utils/base_qr.dart';

import '../qr_models/qr_link/qr_link.dart';

abstract class QrCode {
  QrType get type;
  abstract final String rawData;
  static QrType getTypeFromRawData(String rawData) {
    final uriScheme = Uri.parse(rawData).scheme;
    switch (uriScheme) {
      case Schemes.textScheme:
        return QrType.text;
      case Schemes.phoneScheme:
        return QrType.phone;
      case Schemes.mailToScheme:
        return QrType.mailto;
      case Schemes.wifiScheme:
        return QrType.wifi;
      case Schemes.smsToScheme:
        return QrType.smsto;
      case Schemes.urlSafeScheme:
        return QrType.link;
      case Schemes.urlScheme:
        return QrType.link;
      default:
        return QrType.unidentified;
    }
  }

  factory QrCode.fromRawData(String rawData){
    final uriScheme = Uri.parse(rawData).scheme;
    switch (uriScheme) {
      case Schemes.textScheme:
        return QrText(rawData: rawData);
      case Schemes.phoneScheme:
        return QrPhoneModel.fromRawData(rawData: rawData);
      case Schemes.mailToScheme:
        return QrMailTo.fromRawData(rawData: rawData);
      case Schemes.wifiScheme:
        return QrWifi.fromRawData(rawData: rawData);
      case Schemes.smsToScheme:
        return QrSmsTo.fromRawData(rawData: rawData);
      case Schemes.urlSafeScheme:
        return QrLink.fromRawData(rawData: rawData);
      case Schemes.urlScheme:
        return QrLink.fromRawData(rawData: rawData);
      default:
        return BaseQrModel(rawData: rawData);
    }
  }
}
