import '../../data/qr_types.dart';
import '../../utils/base_qr.dart';
import '../../extensions/only_specific_digits.dart';
import 'package:qr_parser/src/data/qr_types.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import '../../data/schemes.dart';
import '../../utils/launcher.dart';

class QrPhoneModel extends BaseQrModel with Launcher {
  QrPhoneModel({required super.rawData, required String phoneNumber})
      : assert(phoneNumber.isNotEmpty);

  @override
  QrTypes get type => QrTypes.phone;

  String get phoneOnlyDigits => String.fromCharCodes(
      super.rawData.codeUnits.where((unit) => OnlySpecificDigits.isDigit(unit)));

  factory QrPhoneModel.fromRawData({required String rawData}) {
    final phoneUri = Uri.parse(rawData);
    if (phoneUri.scheme != Schemes.phoneScheme) {
      throw Exception('This is not a phone number');
    } else {
      var l = QrPhoneModel(rawData: rawData, phoneNumber: phoneUri.path);
      return QrPhoneModel(rawData: rawData, phoneNumber: phoneUri.path);
    }
  }

  @override
  void launch() async {
    final uri = Uri.parse(rawData);
    if (await url_launcher.canLaunchUrl(uri)) {
      url_launcher.launchUrl(Uri.parse(rawData));
    } else {
      throw Exception('Cannot launch phone number url');
    }
  }
}
