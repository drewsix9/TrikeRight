class Validator {
  static bool isEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isPassword(String password) {
    return password.length >= 6;
  }

  static bool isPhoneNumber(String phoneNumber) {
    return RegExp(r"^[0-9]{10}").hasMatch(phoneNumber);
  }

  static bool isName(String name) {
    return RegExp(r"^[a-zA-Z]+").hasMatch(name);
  }
}
