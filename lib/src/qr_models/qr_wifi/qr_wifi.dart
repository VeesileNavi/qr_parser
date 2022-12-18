import 'package:qr_parser/src/data/schemes.dart';

import '../../data/qr_types.dart';
import '../../utils/base_qr.dart';
import 'qr_wifi_data.dart';
///This model contains all the necessary information about the Wi-Fi network transmitted in the qr-code
class QrWifi extends BaseQrModel {

  ///Define he constructor
  QrWifi({
    required super.rawData,
    required String ssid,
    required bool hidden,
    String? certificate,
    String? password,
  });

  ///Getter to get qr code type
  @override
  QrTypes get type => QrTypes.wifi;

  ///The constructor allows you to get the Wi-Fi model using raw data
  factory QrWifi.fromRawData({required String rawData}) {
    final wifiUri = Uri.parse(rawData);

    ///Throw exception if scheme is not wifi scheme
    if (wifiUri.scheme != Schemes.wifiScheme) {
      throw Exception('This is not wifi connection model');
    }
    ///If [wifiUri.scheme == Schemes.wifiScheme]
    ///Retrieving data using regular expressions
    else {

      ///SSID (name)
      final ssid = QrWifiData.ssidRegExp.stringMatch(rawData);

      ///Security certificate (WPA/WPA2/NONE)
      final certificate = QrWifiData.certificateRegExp.stringMatch(rawData);

      ///Password
      final password = QrWifiData.passwordRegExp.stringMatch(rawData);

      ///Network accessibility (hidden/NONE)
      final hidden = bool.fromEnvironment(
        QrWifiData.accessibilityRegExp.stringMatch(rawData) ?? 'false',
      );

      ///Return whole qrWifiModel
      return QrWifi(
        rawData: rawData,
        ssid: ssid ?? '',
        certificate: certificate,
        password: password,
        hidden: hidden,
      );
    }
  }
}
