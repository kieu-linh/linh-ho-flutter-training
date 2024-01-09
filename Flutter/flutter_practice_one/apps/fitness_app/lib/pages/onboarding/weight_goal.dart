import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/input_body_measurements.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/components/top_onboarding.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WeightGoalPage extends StatelessWidget {
  const WeightGoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    // ignore: omit_local_variable_types, prefer_final_locals
    TextEditingController weightController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FATopNavigation(
                  onLeadingPress: () =>
                      GoRouter.of(context).go('/weightScreen'),
                  trailing: TextButton(
                    onPressed: () => GoRouter.of(context).go('/getStartScreen'),
                    child: Text(
                      s.skipPage,
                      style: context.textTheme.labelSmall,
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                TopOnBoarding(title: s.goalWeight, currentStep: 4),
                const SizedBox(height: 20),
                FABodyMeasurementInput(
                  textLeft: s.lbs,
                  textRight: s.kg,
                  controller: weightController,
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: FAButton(
              text: s.btnNextStep,
              onPressed: () => GoRouter.of(context).go('/heightScreen'),
            ),
          ),
        ],
      ),
    );
  }
}
