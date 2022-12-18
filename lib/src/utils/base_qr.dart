import '../data/qr_types.dart';

class BaseQrModel {
  final String rawData;
  QrTypes get type => QrTypes.unidentified;
  const BaseQrModel({required this.rawData});
}
