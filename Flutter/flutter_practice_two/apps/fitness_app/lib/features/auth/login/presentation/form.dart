import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_ui/components/input.dart';
import 'package:fitness_ui/components/input_password.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    required this.isEmailValid,
    super.key,
    this.onChanged,
    this.readOnly = false,
  });

  final bool isEmailValid;
  final Function(String)? onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return FAInput(
      onChanged: onChanged,
      hintText: s.hintTextEmail,
      icon: isEmailValid ? FAIcon.iconTick : null,
      validator: FAValidator.validatorEmail,
      textInputAction: TextInputAction.next,
      readOnly: readOnly,
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    this.onSubmit,
    super.key,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  });
  final VoidCallback? onSubmit;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return FAPasswordInput(
      hintText: s.hintTextPassword,
      obscureText: true,
      validator: FAValidator.validatorPassword,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmit: (_) {
        onSubmit?.call();
      },
      readOnly: readOnly,
    );
  }
}
