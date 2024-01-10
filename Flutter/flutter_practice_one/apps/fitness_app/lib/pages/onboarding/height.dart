import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/input_body_measurements.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/components/top_onboarding.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/utils/change_value.dart';
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
                      GoRouter.of(context).go('/weightGoalScreen'),
                  trailing: TextButton(
                    onPressed: () => GoRouter.of(context).go('/getStartScreen'),
                    child: Text(
                      s.skipPage,
                      style: context.textTheme.labelSmall,
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                TopOnBoarding(title: s.heightTitle, currentStep: 5),
                const SizedBox(height: 20),
                FABodyMeasurementInput(
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
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: FAButton(
              text: s.btnNextStep,
              onPressed: () => GoRouter.of(context).go('/levelScreen'),
            ),
          ),
        ],
      ),
    );
  }
}
