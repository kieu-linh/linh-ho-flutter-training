// ignore_for_file: inference_failure_on_function_return_type

import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FAInputPassword extends StatelessWidget {
  const FAInputPassword({
    this.hintText = '',
    this.controller,
    this.textInputAction,
    this.onFieldSubmit,
    super.key,
    this.keyboardType,
    this.validator,
    this.onPressed,
    this.obscureText = false,
    this.onChanged,
    this.icon,
  });

  final TextEditingController? controller;
  final Function(String)? onFieldSubmit;
  final Function()? onPressed;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final String? icon;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Function(String)? onChanged;

  //Define value for show password
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FAText.headlineMedium(context, text: hintText),
        const SizedBox(height: 7),
        TextFormField(
          controller: controller,
          onFieldSubmitted: onFieldSubmit,
          keyboardType: keyboardType,
          onChanged: onChanged,
          //obscureText = true => can show,hidden password
          //obscureText = false => only show text
          // ignore: avoid_bool_literals_in_conditional_expressions
          obscureText: obscureText,
          obscuringCharacter: '*',
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: context.colorScheme.outline.withOpacity(0.25),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: context.colorScheme.outline.withOpacity(0.25),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: context.colorScheme.outline.withOpacity(0.25),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: context.colorScheme.errorContainer,
              ),
            ),
            hintText: hintText,
            suffixIcon: GestureDetector(
              onTap: onPressed,
              child: SvgPicture.asset(
                icon!,
                // ignore: deprecated_member_use
                color: context.colorScheme.onSurface,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 17,
              minWidth: 47,
            ),
          ),
          style: AppTextStyles.labelMedium,
        ),
      ],
    );
  }
}
