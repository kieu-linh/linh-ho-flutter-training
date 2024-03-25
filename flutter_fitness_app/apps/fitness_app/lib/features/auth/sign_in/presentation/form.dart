import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_ui/components/input.dart';
import 'package:fitness_ui/components/input_password.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    this.isValid = true,
    this.readOnly = false,
    this.onChanged,
    this.controller,
    super.key,
  });

  final bool isValid;
  final Function(String)? onChanged;
  final bool readOnly;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return FAInput(
      onChanged: onChanged,
      hintText: context.l10n.EmailHintText,
      icon: isValid ? FAIcon.iconTick : null,
      validator: FAValidator.validatorEmail,
      readOnly: readOnly,
      controller: controller,
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    this.textInputAction = TextInputAction.done,
    this.validator = FAValidator.validatorPassword,
    this.readOnly = false,
    this.hintText = '',
    this.onSubmit,
    this.onChanged,
    super.key,
  });
  final VoidCallback? onSubmit;
  final Function(String)? onChanged;
  final bool readOnly;
  final String hintText;
  final TextInputAction textInputAction;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return FAPasswordInput(
      hintText: hintText,
      obscureText: true,
      validator: validator,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmit: (_) => onSubmit?.call(),
      readOnly: readOnly,
    );
  }
}
