class VerificationHelper {
  static final VerificationHelper _instance = VerificationHelper._internal();
  VerificationHelper._internal();
  static VerificationHelper get instance => _instance;

  bool isAdult(DateTime dateOfBirth) {
    final DateTime now = DateTime.now();
    final int age = now.year - dateOfBirth.year;

    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      return age >= 18;
    }

    return age >= 18;
  }

  bool isOver100(DateTime birthDate) {
    DateTime currentDate = DateTime.now();

    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age > 100;
  }

  bool isValidEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(email);
  }

  bool containsSpecialCharacters(String stringa) {
    RegExp regex = RegExp(r'[^a-zA-Z0-9]');
    return regex.hasMatch(stringa);
  }
}
