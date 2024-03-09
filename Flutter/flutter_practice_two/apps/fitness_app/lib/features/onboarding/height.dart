import 'package:fitness_app/core/extension/number.dart';
import 'package:fitness_app/features/onboarding/layout/scaffold.dart';
import 'package:fitness_ui/components/input_body_measurements.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({super.key});

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  TextEditingController heightController = TextEditingController();
  double heightValue = 0;
  @override
  Widget build(BuildContext context) {

    return FAScaffold(
      onBack: () => GoRouter.of(context).go('/weight-goal'),
      currentStep: 5,
      title: context.l10n.heightTitle,
      body: Padding(
        padding: context.padding(top: 20),
        child: FABodyMeasurementInput(
          onLeftPressed: () {
            heightValue =
                heightValue.toDoubleValue(double.parse(FAUiS.current.cmToFeet));
            heightController.text = heightValue.toStringAsFixed(2);
          },
          onRightPressed: () {
            heightValue = heightValue.toDoubleValue(
              double.parse(FAUiS.current.feetToCm),
            );
            heightController.text = heightValue.toStringAsFixed(2);
          },
          onChange: (value) => heightValue = double.parse(value),
          textLeft: context.l10n.feet,
          textRight: context.l10n.cm,
          controller: heightController,
        ),
      ),
      onNext: () => GoRouter.of(context).go('/level'),
    );
  }
}
