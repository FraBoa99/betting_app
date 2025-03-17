class Regex {
  static final Regex _instance = Regex._internal();
  Regex._internal();

  static Regex get instance => _instance;

  bool isValidEmailFormat(String email) {
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

  bool isPhoneNumber(String input) {
    final phoneRegExp = RegExp(r"^\+?[1-9]\d{1,14}$");
    return phoneRegExp.hasMatch(input);
  }
}
