import 'package:fitness_app/core/utils/change_value.dart';
import 'package:fitness_app/pages/onboarding/layout/scaffold.dart';
import 'package:fitness_ui/components/input_body_measurements.dart';
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
  double saveValue = 0;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return FAScaffold(
      onBack: () => GoRouter.of(context).go('/ageScreen'),
      currentStep: 3,
      title: s.weightTitle,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: FABodyMeasurementInput(
          onLeftPressed: () {
            saveValue = ChangeValue.convertValue(
              saveValue,
              weightController,
              double.parse(FAUiS.current.kgToLbs),
            );
          },
          onRightPressed: () {
            saveValue = ChangeValue.convertValue(
              saveValue,
              weightController,
              double.parse(FAUiS.current.LbsToKg),
            );
          },
          onChange: (value) {
            saveValue = double.parse(value);
          },
          textLeft: s.lbs,
          textRight: s.kg,
          controller: weightController,
        ),
      ),
      onNext: () => GoRouter.of(context).go('/weightGoalScreen'),
    );
  }
}
