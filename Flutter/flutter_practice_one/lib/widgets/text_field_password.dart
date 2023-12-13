// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_svg/svg.dart';

class FATextFieldPassword extends StatefulWidget {
  const FATextFieldPassword({
    required this.hintText,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.icon,
    super.key,
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final String hintText;
  final String? icon;

  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;

  @override
  State<FATextFieldPassword> createState() => _FATextFieldPasswordState();
}

class _FATextFieldPasswordState extends State<FATextFieldPassword> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hintText,
          style: AppTextStyles.labelLarge,
        ),
        const SizedBox(height: 7),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF696969).withOpacity(0.25),
            ),
            color: const Color(0xFFF5F5F5),
          ),
          child: TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            keyboardType: widget.keyboardType,
            obscureText: !showPassword,
            obscuringCharacter: '*',
            validator: widget.validator,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: AppTextStyles.labelMedium,
              suffixIcon: GestureDetector(
                onTap: () => setState(() {
                  showPassword = !showPassword;
                }),
                child: !showPassword
                    ? SvgPicture.asset(
                        'assets/icons/ic_eye.svg',
                        width: 16,
                        height: 14,
                        fit: BoxFit.scaleDown,
                      )
                    : const Icon(
                        Icons.remove_red_eye_rounded,
                        color: AppColor.onSurfaceVariant,
                        size: 18,
                      ),
              ),
            ),
            style: AppTextStyles.labelMedium,
          ),
        ),
      ],
    );
  }
}
