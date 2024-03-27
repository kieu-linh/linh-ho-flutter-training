import 'package:fitness_app/core/extension/number.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:fitness_app/features/onboarding/layout/scaffold.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/input_body_measurements.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WeightGoalPage extends StatefulWidget {
  const WeightGoalPage({super.key});

  @override
  State<WeightGoalPage> createState() => _WeightGoalPageState();
}

class _WeightGoalPageState extends State<WeightGoalPage> {
  TextEditingController weightController = TextEditingController();
  double weightValue = 0;

  @override
  Widget build(BuildContext context) {
    return FAScaffold(
      onBack: () => context.go(AppRoutes.weightScreen.path),
      currentStep: 4,
      title: context.l10n.goalWeightTitle,
      body: Padding(
        padding: context.padding(top: 20),
        child: FABodyMeasurementInput(
          onLeftPressed: () {
            weightValue = weightValue.toDoubleValue(
              double.parse(FAUiS.current.kgToLbs),
            );
            weightController.text = weightValue.toStringAsFixed(2);
          },
          onRightPressed: () {
            weightValue = weightValue.toDoubleValue(
              double.parse(FAUiS.current.LbsToKg),
            );
            weightController.text = weightValue.toStringAsFixed(2);
          },
          onChange: (value) => weightValue = double.parse(value),
          textLeft: context.l10n.lbs,
          textRight: context.l10n.kg,
          controller: weightController,
          validator: FAValidator.validatorWeight,
        ),
      ),
      onNext: () {
        userStarted..weightGoal = double.parse(weightController.text);
        context.go(AppRoutes.height.path);
      },
    );
  }
}
