import 'package:fitness_app/core/extension/string.dart';
import 'package:fitness_app/features/onboarding/layout/scaffold.dart';
import 'package:fitness_ui/components/input_body_measurements.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WeightGoalPage extends StatefulWidget {
  const WeightGoalPage({super.key});

  @override
  State<WeightGoalPage> createState() => _WeightGoalPageState();
}

class _WeightGoalPageState extends State<WeightGoalPage> {
  TextEditingController weightController = TextEditingController();
  double saveValue = 0;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    // ignore: omit_local_variable_types, prefer_final_locals
    return FAScaffold(
      onBack: () => GoRouter.of(context).go('/weightScreen'),
      currentStep: 4,
      title: s.goalWeight,
      body: Padding(
        padding: context.padding(top: 20),
        child: FABodyMeasurementInput(
          onLeftPressed: () {
            saveValue = ChangeValue.toDouble(
              saveValue,
              weightController,
              double.parse(FAUiS.current.kgToLbs),
            );
          },
          onRightPressed: () {
            saveValue = ChangeValue.toDouble(
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
      onNext: () => GoRouter.of(context).push('/heightScreen'),
    );
  }
}
