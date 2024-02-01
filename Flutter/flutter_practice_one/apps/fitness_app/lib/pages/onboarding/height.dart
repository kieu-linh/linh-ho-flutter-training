import 'package:fitness_app/core/utils/change_value.dart';
import 'package:fitness_app/pages/onboarding/layout/scaffold.dart';
import 'package:fitness_ui/components/input_body_measurements.dart';
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
  double saveValue = 0;
  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return FAScaffold(
      onBack: () => GoRouter.of(context).go('/weightGoalScreen'),
      currentStep: 5,
      title: s.heightTitle,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: FABodyMeasurementInput(
          onLeftPressed: () {
            saveValue = ChangeValue.convertValue(
              saveValue,
              heightController,
              double.parse(FAUiS.current.cmToFeet),
            );
          },
          onRightPressed: () {
            saveValue = ChangeValue.convertValue(
              saveValue,
              heightController,
              double.parse(FAUiS.current.feetToCm),
            );
          },
          onChange: (value) {
            saveValue = double.parse(value);
          },
          textLeft: s.feet,
          textRight: s.cm,
          controller: heightController,
        ),
      ),
      onNext: () => GoRouter.of(context).go('/levelScreen'),
    );
  }
}
