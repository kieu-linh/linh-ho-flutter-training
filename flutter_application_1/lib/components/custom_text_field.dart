import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.action,
    this.icon,
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputAction? action;
  final Icon? icon;
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
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 20.0, bottom: 6.0),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 24.0)
              .copyWith(fontWeight: FontWeight.w300),
          prefixIcon: icon != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: icon,
                )
              : null,
        ),
        textInputAction: action,
      ),
    );
  }
}
