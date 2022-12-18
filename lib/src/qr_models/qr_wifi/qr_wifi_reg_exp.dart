class QrWifiData{
  static RegExp ssidRegExp =  RegExp(r'(?<=S:)(.*?)(?=\;)');
  static RegExp certificateRegExp =  RegExp(r'(?<=T:)(.*?)(?=\;)');
  static RegExp passwordRegExp =  RegExp(r'(?<=P:)(.*?)(?=\;)');
  static RegExp accessibilityRegExp = RegExp(r'(?<=H:)(.*?)(?=\;)');
}