import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';

class FARichText extends StatelessWidget {
  const FARichText({
    super.key,
    this.fistText,
    this.secondText,
    this.thirdText,
  });

  final String? fistText;
  final String? secondText;
  final String? thirdText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: fistText,
        style: AppTextStyles.titlePrimary.copyWith(color: Colors.black),
        children: [
          TextSpan(text: secondText, style: AppTextStyles.titlePrimary),
          TextSpan(text: thirdText),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
