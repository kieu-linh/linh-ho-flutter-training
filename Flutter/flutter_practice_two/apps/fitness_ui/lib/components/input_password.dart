// ignore_for_file: inference_failure_on_function_return_type

import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';

class FAPasswordInput extends StatefulWidget {
  const FAPasswordInput({
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
    this.onTap,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final Function(String)? onFieldSubmit;
  final Function()? onPressed;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  State<FAPasswordInput> createState() => _FAPasswordInputState();
}

class _FAPasswordInputState extends State<FAPasswordInput> {
  //Define value for show password
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sizeHeight(115),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FAText.headlineMedium(context, text: widget.hintText),
          const SizedBox(height: 7),
          TextFormField(
            controller: widget.controller,
            onFieldSubmitted: widget.onFieldSubmit,
            keyboardType: widget.keyboardType,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            //obscureText = true => can show,hidden password
            //obscureText = false => only show text
            // ignore: avoid_bool_literals_in_conditional_expressions
            obscureText: widget.obscureText ? !showPassword : false,
            obscuringCharacter: '*',
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            readOnly: widget.readOnly,
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
                  color: context.colorScheme.errorContainer,
                ),
              ),
              hintText: widget.hintText,
              suffixIcon: GestureDetector(
                onTap: widget.obscureText
                    ? () {
                        //showPassword = true =>  hidden password
                        //default start
                        showPassword = !showPassword;
                        setState(() {});
                      }
                    : null,
                child: FAIcons(
                  iconLink: showPassword ? FAIcon.iconEyeOpen : FAIcon.iconEye,
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
      ),
    );
  }
}
