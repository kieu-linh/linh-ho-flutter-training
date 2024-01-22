// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:sign_in_bloc/core/color/app_color.dart';
import 'package:sign_in_bloc/core/typography/text_style.dart';

class FAInput extends StatefulWidget {
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
        Text(widget.hintText),
        //FAText.headlineMedium(context, text: widget.hintText),
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
                color: AppColor.outlineColor.withOpacity(0.25),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColor.outlineColor.withOpacity(0.25),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColor.outlineColor.withOpacity(0.25),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColor.error.withOpacity(0.1),
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
                    child: showPassword
                        ? const Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColor.onSurfaceVariant,
                          )
                        : const Icon(Icons.remove_red_eye_sharp),
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
