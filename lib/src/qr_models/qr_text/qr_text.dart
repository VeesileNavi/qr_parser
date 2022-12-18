import 'package:qr_parser/src/data/qr_types.dart';
import 'package:qr_parser/src/utils/base_qr.dart';


class QrText extends BaseQrModel{
  QrText({required super.rawData});
  @override
  QrType get type => QrType.text;
}