import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
/// validator for input field
class FAValidator {

  /// validator for email field 
  static String? validatorEmail(dynamic value) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);

    /// check empty email 
    if ((value as String).isEmpty) {
      return FAUiS.current.requiredValue;

    /// check format email
    } else if (!regex.hasMatch(value)) {
      return FAUiS.current.validEmail;
    }

    return null;
  }

  /// validator for password field
  static String? validatorPassword(dynamic value) {
    const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])';
    final regex = RegExp(pattern);

    /// check empty password 
    if ((value! as String).isEmpty) {
      return FAUiS.current.requiredValue;

    /// check length of password 
    } else if ((value as String).length < 6) {
      return FAUiS.current.lengthPass;
    
    /// check character special of password
    } else if (!regex.hasMatch(value)) {
      return FAUiS.current.characterPass;
    }
    
    return null;
  }
}


