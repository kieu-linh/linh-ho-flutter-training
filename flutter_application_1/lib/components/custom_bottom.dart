import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      Color? color,
      this.textColor = Colors.white,
      Color? borderColor,
      BorderRadius? borderRadius,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 95.0, vertical: 13.0)})
      : color = color ?? const Color(0xff2D201C),
        borderColor = borderColor ?? const Color(0xff2D201C),
        borderRadius = borderRadius ?? BorderRadius.circular(30.0);
  CustomButton.outline(
      {super.key,
      this.onPressed,
      required this.text,
      Color? color,
      this.textColor = Colors.white,
      Color? borderColor,
      BorderRadius? borderRadius,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 95.0, vertical: 13.0)})
      : color = color ?? Colors.white.withOpacity(0.25),
        borderColor = borderColor ?? Colors.white,
        borderRadius = borderRadius ?? BorderRadius.circular(30.0);
  CustomButton.smallOutline(
      {super.key,
      this.onPressed,
      required this.text,
      Color? color,
      this.textColor = Colors.white,
      Color? borderColor,
      BorderRadius? borderRadius,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 53.0, vertical: 15.0)})
      : color = color ?? Colors.white.withOpacity(0.25),
        borderColor = borderColor ?? Colors.white,
        borderRadius = borderRadius ?? BorderRadius.circular(30.0);
  CustomButton.small({
    super.key,
    this.onPressed,
    required this.text,
    Color? color,
    this.textColor = Colors.white,
    Color? borderColor,
    BorderRadius? borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 53.0, vertical: 15.0),
  })  : color = color ?? const Color(0xff2D201C),
        borderColor = borderColor ?? const Color(0xff2D201C),
        borderRadius = borderRadius ?? BorderRadius.circular(30.0);

  final Function()? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color,
          border: Border.all(color: borderColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
