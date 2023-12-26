// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/constant/icons.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_svg/svg.dart';

class FAInput extends StatefulWidget {
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
  final TextInputAction? textInputAction;
  final bool obscureText;

  @override
  State<FAInput> createState() => _FAInputState();
}

class _FAInputState extends State<FAInput> {

  //Define value for show password
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
              color: context.colorScheme.outline.withOpacity(0.25),
            ),
            color: context.colorScheme.onSecondary,
          ),
          child: TextFormField(
            controller: widget.controller,
            onFieldSubmitted: widget.onFieldSubmit,
            keyboardType: widget.keyboardType,

            //obscureText = true => can show,hidden password
            //obscureText = false => only show text
            // ignore: avoid_bool_literals_in_conditional_expressions
            obscureText: widget.obscureText ? !showPassword : false,
            obscuringCharacter: '*',
            validator: widget.validator,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              suffixIcon: widget.icon == null
                  ? null
                  : GestureDetector(
                      onTap: widget.obscureText
                          ? () {
                              //showPassword = true =>  hidden password
                              //default start
                              showPassword = !showPassword;
                              setState(() {});
                            }
                          : null,
                      child: SvgPicture.asset(
                        showPassword ? FAIcons.iconEyeOpen : widget.icon!,
                        // ignore: deprecated_member_use
                        color: context.colorScheme.onSurface,
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
