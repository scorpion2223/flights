extension StringExtention on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidPasswordForm() {
    return RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#()+=])[A-Za-z\d@$!%*?&#()+=]+$')
        .hasMatch(this);
  }

  bool isValidNameString() {
    return RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(this);
  }

  bool isWhiteSpace() => trim().isEmpty;

  bool isValidPassword() => length < 8;

  bool isValidNameMaxLenght() => length > 100;

  bool isValidNameMinLenght() => length < 2;

  bool isValidPhoneLingth() => length != 10;

  bool isValidInternationalIDLength() => length == 11;

  bool isValidFamilyBookNumber() => length == 6;
}
