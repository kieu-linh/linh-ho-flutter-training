import 'package:flutter/material.dart';

class CustomTextFieldPassword extends StatefulWidget {
  const CustomTextFieldPassword({
    super.key,
    required this.controller,
    required this.hintText,
    this.action,
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputAction? action;

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffD6D6D6),
            width: 0.5,
          ),
        ),
      ),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 20.0, bottom: 6.0),
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 24.0)
              .copyWith(fontWeight: FontWeight.w300),
          suffixIcon: GestureDetector(
              onTap: () {
                isShowPassword = !isShowPassword;
                setState(() {});
              },
              child: Icon(
                !isShowPassword
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined,
              )),
        ),
        obscureText: !isShowPassword,
        textInputAction: widget.action,
      ),
    );
  }
}
