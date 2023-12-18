// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_svg/svg.dart';

class FAInput extends StatelessWidget {
  const FAInput({
    required this.hintText,
    this.icon,
    this.controller,
    this.textInputAction,
    this.onFieldSubmit,
    super.key,
    this.keyboardType,
    this.validator,
    this.onPressed,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final Function(String)? onFieldSubmit;
  final Function()? onPressed;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final String? icon;
  final bool obscureText;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: AppTextStyles.labelLarge,
        ),
        const SizedBox(height: 7),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.outlineColor.withOpacity(0.25),
            ),
            color: AppColor.onSecondary,
          ),
          child: TextFormField(
            controller: controller,
            onFieldSubmitted: onFieldSubmit,
            keyboardType: keyboardType,
            obscureText: obscureText,
            obscuringCharacter: '*',
            validator: validator,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              suffixIcon: icon == null
                  ? null
                  : GestureDetector(
                      onTap: onPressed,
                      child: SvgPicture.asset(
                        icon!,
                        // ignore: deprecated_member_use
                        color: AppColor.onSurfaceVariant,
                      ),
                    ),
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 17,
                maxWidth: 17,
              ),
            ),
            style: AppTextStyles.labelMedium,
          ),
        ),
      ],
    );
  }
}
