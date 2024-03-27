import 'package:fitness_ui/l10n/generated/l10n.dart';

/// validator for input field
class FAValidator {
  /// validator for email field
  static String? validatorEmail(dynamic value) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);

    /// check email is String or not
    if (value is String) {
      /// check empty email
      if (value.isEmpty) {
        return FAUiS.current.requiredValue;
      }

      /// check valid email
      else if (!regex.hasMatch(value)) {
        return FAUiS.current.emailValid;
      }
    } else {
      return FAUiS.current.emailValid;
    }

    return null;
  }

  /// validator for password field
  static String? validatorPassword(dynamic value) {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%&*~.,;:])';
    final regex = RegExp(pattern);

    /// check password is String or not
    if (value is String) {
      /// check empty password
      if (value.isEmpty) {
        return FAUiS.current.requiredValue;
      }

      /// check password length
      else if (value.length < 6) {
        return FAUiS.current.lengthPassText;
      }

      /// check valid password
      else if (!regex.hasMatch(value)) {
        return FAUiS.current.characterPassText;
      }
    } else {
      return FAUiS.current.passwordValid;
    }

    return null;
  }

  static String? validatorInput(dynamic value) {
    /// check input is String or not
    if (value is String) {
      if (value.isEmpty) {
        return FAUiS.current.requiredValue;
      }
    } else {
      return FAUiS.current.requiredValue;
    }

    return null;
  }

  /// validator for password field
  static String? validatorConfirmPassword(dynamic value, String password) {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%&*~.,;:])';
    final regex = RegExp(pattern);

    /// check password is String or not
    if (value is String) {
      /// check empty password
      if (value.isEmpty) {
        return FAUiS.current.requiredValue;
      }

      /// check password length
      else if (value.length < 6) {
        return FAUiS.current.lengthPassText;
      }

      /// check valid password
      else if (!regex.hasMatch(value)) {
        return FAUiS.current.characterPassText;
      }

      /// check valid password
      else if (value != password) {
        return 'Password not match';
      }
    } else {
      return FAUiS.current.passwordValid;
    }

    return null;
  }

  static String? validatorWeight(dynamic value) {
    /// check weight is String or not
    if (value is String) {
      /// check empty weight
      if (value.isEmpty) {
        return FAUiS.current.requiredValue;
      }

      try {
        final weight = double.parse(value);

        /// check valid weight
        if (weight < 10 || weight > 300) {
          return 'Weight should be between 10 and 200';
        }
      } catch (e) {
        return 'Please enter number';
      }
    } else {
      return 'Please enter number';
    }

    return null;
  }

  static String? validatorHeight(dynamic value) {
    /// check height is String or not
    if (value is String) {
      /// check empty height
      if (value.isEmpty) {
        return FAUiS.current.requiredValue;
      }

      try {
        final height = double.parse(value);

        /// check valid weight
        if (height < 100 || height > 200) {
          return 'Height should be between 100 and 200';
        }
      } catch (e) {
        return 'Please enter number';
      }
    } else {
      return 'Please enter number';
    }

    return null;
  }

  static String? validatorAge(dynamic value) {
    /// check age is String or not
    if (value is String) {
      /// check empty age
      if (value.isEmpty) {
        return FAUiS.current.requiredValue;
      }

      try {
        final age = int.parse(value);

        /// check valid age
        if (age < 5 || age > 90) {
          return 'Age should be between 6 and 90';
        }
      } catch (e) {
        return 'Please enter number';
      }
    } else {
      return 'Please enter number';
    }

    return null;
  }
}
