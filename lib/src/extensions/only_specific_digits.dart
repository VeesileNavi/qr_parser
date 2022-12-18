extension OnlySpecificDigits on List<int> {
  /// return if char is in between 0..9,
  static bool isDigit(i) => i > 47 && i < 58;
  Iterable<int> get onlyDigits => where(isDigit);
}