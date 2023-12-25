import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';

class TopOnBoarding extends StatelessWidget {
  const TopOnBoarding({
    required this.title,
    required this.currentStep,
    this.numberOfSteps = 7,
    super.key,
  });

  final int currentStep;
  final int numberOfSteps;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.stepPage(currentStep, numberOfSteps),
          style: AppTextStyles.textStepPage,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: AppTextStyles.headlineLarge,
        ),
      ],
    );
  }
}
