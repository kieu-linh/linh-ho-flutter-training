import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';

class FARichText extends StatelessWidget {
  FARichText({
    super.key,
    this.fistText,
    this.secondText,
    this.thirdText,
    TextStyle? textStyleFirst,
    TextStyle? textStyleSecond,
  })  : textStyleFirst = textStyleFirst ??
            AppTextStyles.titlePrimary.copyWith(color: Colors.black),
        textStyleSecond = textStyleSecond ?? AppTextStyles.titlePrimary;

  final String? fistText;
  final String? secondText;
  final String? thirdText;
  final TextStyle textStyleFirst;
  final TextStyle textStyleSecond;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: fistText,
        style: textStyleFirst,
        children: [
          TextSpan(text: secondText, style: textStyleSecond),
          TextSpan(text: thirdText),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
