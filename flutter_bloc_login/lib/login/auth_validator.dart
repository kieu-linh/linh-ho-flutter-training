class FAValidator {
  static String? validatorEmail(dynamic value, {bool? check}) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);
    if ((value as String).isEmpty) {
      return 'This field is required';
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    check = true;
    return null;
  }

  static String? validatorPassword(dynamic value) {
    const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])';
    final regex = RegExp(pattern);

    if ((value! as String).isEmpty) {
      return 'This field is required';
    } else if ((value as String).length < 6) {
      return 'Password must be at least 6 digits long';
    } else if (!regex.hasMatch(value)) {
      return 'Password least uppercase and special character.';
    }
    return null;
  }

  static bool checkLoginInValidator({
    required String? email,
    required String? password,
  }) {
    return validatorEmail(email) == null && validatorPassword(password) == null;
  }
}
