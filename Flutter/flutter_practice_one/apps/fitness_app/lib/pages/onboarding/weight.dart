import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/input_body_measurements.dart';
import 'package:fitness_ui/components/top_control.dart';
import 'package:fitness_ui/components/top_onboarding.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
        final s = FAUiS.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FATopControl(
                  onPressed: () => GoRouter.of(context).go('/ageScreen'),
                  text: s.skipPage,
                  onTap: () => GoRouter.of(context).go('/getStartScreen'),
                ),
                const SizedBox(height: 9),
                TopOnBoarding(title: s.weightTitle, currentStep: 3),
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
              onPressed: () => GoRouter.of(context).go('/weightGoalScreen'),
            ),
          ),
        ],
      ),
    );
  }
}
