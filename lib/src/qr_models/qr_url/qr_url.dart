import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_parser/src/data/qr_types.dart';
import 'package:qr_parser/src/utils/base_qr.dart';
import 'package:qr_parser/src/utils/launcher.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../../data/schemes.dart';

class QrUrl extends BaseQrModel with Launcher{
  const QrUrl({required super.rawData, required this.host});

  final String host;

  @override
  QrType get type => QrType.url;

  factory QrUrl.fromRawData({required String rawData}){
    final uri = Uri.parse(rawData);
    if(uri.scheme==Schemes.urlSafeScheme && uri.scheme==Schemes.urlScheme){
      log(uri.scheme);
    }

    return QrUrl(rawData: rawData, host: uri.host);
  }

  @override
  void launch() async {
    final uri = Uri.parse(rawData);
    if (await url_launcher.canLaunchUrl(uri)) {
      url_launcher.launchUrl(Uri.parse(rawData));
    } else {
      debugPrintStack(
          stackTrace: StackTrace.fromString('Cannot launch url'),
          label: 'Error occurred during ur startup');
    }
  }
}
