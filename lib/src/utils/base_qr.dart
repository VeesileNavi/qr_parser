import 'package:qr_parser/src/utils/qr_code.dart';

import '../data/qr_types.dart';

class BaseQrModel with QrCode{
  @override
  final String rawData;

  @override
  QrType get type => QrType.unidentified;

  const BaseQrModel({required this.rawData});
}
