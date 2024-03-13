import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/components/top_onboarding.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FAScaffold extends StatelessWidget {
  const FAScaffold({
    required this.body,
    required this.currentStep,
    required this.title,
    this.onBack,
    this.onNext,
    super.key,
  });

  final Widget body;
  final int currentStep;
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FATopNavigation(
              trailing: TextButton(
                onPressed: () => GoRouter.of(context).go('/get-start'),
                child: Text(
                  context.l10n.skipPageText,
                  style: context.textTheme.labelSmall,
                ),
              ),
              onLeadingPress: onBack,
            ),
            const SizedBox(height: 9),
            TopOnBoarding(currentStep: currentStep, title: title),
            Expanded(child: body),
            Padding(
              padding: context.padding(bottom: 30),
              child: FAButton(
                text: context.l10n.nextStepText,
                onPressed: onNext,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
