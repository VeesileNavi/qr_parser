import 'package:flutter/material.dart';

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
    return const Scaffold(
      body:
          Center(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
