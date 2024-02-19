import 'package:fitness_ui/core/color/app_color.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

/// Popup widget that you can use by default to show some information
class FASnackBar extends StatefulWidget {
  FASnackBar.success({
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    TextStyle? textStyle,
    this.maxLines = 2,
    this.backgroundColor = AppColor.iconColor,
    super.key,
  }) : textStyle = textStyle ?? AppTextStyles.nameUser;

  FASnackBar.error({
    this.message = 'Unexpected',
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    TextStyle? textStyle,
    this.maxLines = 2,
    this.backgroundColor = AppColor.error,
    super.key,
  }) : textStyle = textStyle ?? AppTextStyles.nameUser;

  final String message;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final int maxLines;
  final EdgeInsetsGeometry messagePadding;

  @override
  State<FASnackBar> createState() => _FASnackBarState();
}

class _FASnackBarState extends State<FASnackBar> {
  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Center(
      child: ElevatedButton(
        child: Text(s.startNow),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Padding(
                padding: widget.messagePadding,
                child: Text(
                  widget.message,
                  maxLines: widget.maxLines,
                ),
              ),
              action: SnackBarAction(
                backgroundColor: widget.backgroundColor,
                label: 'Action',
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
