import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';

class FAValidator {
  static String? validatorEmail(dynamic value) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);

    if ((value as String).isEmpty) {
      return FAUiS.current.requiredValue;
    } else if (!regex.hasMatch(value)) {
      return FAUiS.current.validEmail;
    }

    return null;
  }

  static String? validatorPassword(dynamic value) {
    const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])';
    final regex = RegExp(pattern);

    if ((value! as String).isEmpty) {
      return FAUiS.current.requiredValue;
    } else if ((value as String).length < 6) {
      return FAUiS.current.lengthPass;
    } else if (!regex.hasMatch(value)) {
      return FAUiS.current.characterPass;
    }
    
    return null;
  }
}
