import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/components/top_onboarding.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
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
    final s = FAUiS.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FATopNavigation(
              trailing: TextButton(
                onPressed: () => GoRouter.of(context).go('/getStartScreen'),
                child: Text(
                  s.skipPage,
                  style: context.textTheme.labelSmall,
                ),
              ),
              onLeadingPress: onBack,
            ),
            const SizedBox(height: 9),
            TopOnBoarding(currentStep: currentStep, title: title),
            Expanded(child: body),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: FAButton(
                text: s.btnNextStep,
                onPressed: onNext,
                //() => GoRouter.of(context).go('/weightScreen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
