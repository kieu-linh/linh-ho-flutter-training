// ignore_for_file: inference_failure_on_function_return_type

import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FAInput extends StatelessWidget {
  const FAInput({
    this.hintText = '',
    this.icon,
    this.controller,
    this.textInputAction,
    this.onFieldSubmit,
    super.key,
    this.keyboardType,
    this.validator,
    this.onPressed,
    this.onChanged,
  });

  final TextEditingController? controller;
  final Function(String)? onFieldSubmit;
  final Function()? onPressed;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final String? icon;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;

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
            suffixIcon: icon != null
                ? SvgPicture.asset(
                    icon!,
                    // ignore: deprecated_member_use
                    color: context.colorScheme.primary,
                  )
                : null,
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
