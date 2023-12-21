import 'package:flutter/material.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/widgets/button.dart';
import 'package:flutter_practice_one/widgets/input_number.dart';
import 'package:flutter_practice_one/widgets/top_control.dart';
import 'package:flutter_practice_one/widgets/top_onboarding.dart';

class WeightGoalPage extends StatefulWidget {
  const WeightGoalPage({super.key});

  @override
  State<WeightGoalPage> createState() => _WeightGoalPageState();
}

class _WeightGoalPageState extends State<WeightGoalPage> {
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FATopControl(text: context.l10n.skipPage, onPressed: () {  },),
                const SizedBox(height: 7),
                TopOnBoarding(title: context.l10n.goalWeight, currentStep: 4),
                const SizedBox(height: 20),
                FAInputNumber(
                  textLeft: context.l10n.lbs,
                  textRight: context.l10n.kg,
                  controller: weightController,
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 10,
            child: FAButton(
              text: context.l10n.btnNextStep,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

