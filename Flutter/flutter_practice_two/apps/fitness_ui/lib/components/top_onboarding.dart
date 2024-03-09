import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';

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
          context.l10n.stepPageText(currentStep, numberOfSteps),
          style: AppTextStyles.textStepPage,
        ),
        const SizedBox(height: 10),
        FAText.displayLarge(context, text: title),
      ],
    );
  }
}
