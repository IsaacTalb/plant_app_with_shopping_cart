extension EnglishNumberExtension on String {
  String get englishNumber {
    const myan = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    String text = this;
    for (var i = 0; i < english.length; i++) {
      text = text.replaceAll(myan[i], english[i]);
    }
    return text;
  }
}
