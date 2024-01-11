import 'dart:math';
import 'package:fitness_ui/core/color/app_color.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';

/// Popup widget that you can use by default to show some information
class FASnackBar extends StatefulWidget {
  const FASnackBar.success({
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.sentiment_very_satisfied,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = AppColor.iconColor,
    this.boxShadow = defaultBoxShadow,
    this.borderRadius = defaultBorderRadius,
    super.key,
  });

  const FASnackBar.error({
    this.message = 'Unexpected',
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.error_outline,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: AppColor.secondary,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = AppColor.error,
    this.boxShadow = defaultBoxShadow,
    this.borderRadius = defaultBorderRadius,
    super.key,
  });

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int maxLines;
  final int iconRotationAngle;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final double iconPositionTop;
  final double iconPositionLeft;
  final EdgeInsetsGeometry messagePadding;

  @override
  State<FASnackBar> createState() => _FASnackBarState();
}

class _FASnackBarState extends State<FASnackBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //clipBehavior: Clip.hardEdge,
      height: 80,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
        boxShadow: widget.boxShadow,
      ),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: widget.iconPositionTop,
            left: widget.iconPositionLeft,
            child: SizedBox(
              height: 95,
              child: Transform.rotate(
                angle: widget.iconRotationAngle * pi / 180,
                child: widget.icon,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: widget.messagePadding,
              child: Text(
                widget.message,
                style: context.textTheme.bodyMedium?.merge(
                  widget.textStyle,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: widget.maxLines,
                // ignore: deprecated_member_use
                //textScaleFactor: widget.textScaleFactor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const defaultBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 8),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];

const defaultBorderRadius = BorderRadius.all(Radius.circular(12));
