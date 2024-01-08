// ignore_for_file: inference_failure_on_function_return_type

import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';
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
  final bool obscureText;
  final Function(String)? onChanged;

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
        FAText.headlineMedium(context, text: widget.hintText),
        const SizedBox(height: 7),
        TextFormField(
          controller: widget.controller,
          onFieldSubmitted: widget.onFieldSubmit,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          //obscureText = true => can show,hidden password
          //obscureText = false => only show text
          // ignore: avoid_bool_literals_in_conditional_expressions
          obscureText: widget.obscureText ? !showPassword : false,
          obscuringCharacter: '*',
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: widget.textInputAction,
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
                color: context.colorScheme.errorContainer.withOpacity(0.1),
              ),
            ),
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
              minWidth: 47,
            ),
          ),
          style: AppTextStyles.labelMedium,
        ),
      ],
    );
  }
}
