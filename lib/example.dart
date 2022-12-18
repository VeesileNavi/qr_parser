import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_parser/src/qr_models/qr_mailto/qr_mail_to.dart';
import 'package:qr_parser/src/qr_models/qr_phone/qr_phone.dart';
import 'package:qr_parser/src/qr_models/qr_sms_to/qr_sms_to.dart';
import 'package:qr_parser/src/qr_models/qr_text/qr_text.dart';
import 'package:qr_parser/src/qr_models/qr_url/qr_url.dart';
import 'package:qr_parser/src/qr_models/qr_wifi/qr_wifi.dart';
import 'package:qr_parser/src/utils/qr_code.dart';

class Example extends StatelessWidget {
  const Example({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textData = 'This is a text data';
    const wifiData = 'WIFI:T:WEP;S:ThisIsNetworkName;P:password;;';
    const mailToData = 'mailto:example@email.com?subject=This is a subject&body=This is a body!';
    const smsToData = 'smsto:555-555-555:This is a text of the message!';
    const phoneData = 'tel:555-555-555';
    const urlData = 'https://google.com';
    final wifi = QrWifi.fromRawData(rawData: wifiData);
    final mailto = QrMailTo.fromRawData(rawData: mailToData);
    final smsTo = QrSmsTo.fromRawData(rawData: smsToData);
    final phone = QrPhoneModel.fromRawData(rawData: phoneData);
    final url = QrUrl.fromRawData(rawData: urlData);
    final text = QrText(rawData: textData);
    return Scaffold(
      body:
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(wifi.certificate??''),
                Text(mailto.subject),
                Text(smsTo.phone),
                Text(phone.phoneNumber),
                Text(url.host),
                Text(text.rawData),
                ElevatedButton(onPressed: (){getType(wifiData);}, child: Text('launch')),
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void getType(String data){
    final qr = QrCode.fromRawData(data);
    log(qr.type.toString());
  }
}
