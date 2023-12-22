import 'package:flutter/material.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/widgets/button.dart';
import 'package:flutter_practice_one/widgets/input_number.dart';
import 'package:flutter_practice_one/widgets/top_control.dart';
import 'package:flutter_practice_one/widgets/top_onboarding.dart';
import 'package:go_router/go_router.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({super.key});

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
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
                FATopControl(
                  onPressed: () => GoRouter.of(context).go('/weightGoalScreen'),
                  text: context.l10n.skipPage,
                ),
                const SizedBox(height: 7),
                TopOnBoarding(title: context.l10n.height, currentStep: 5),
                const SizedBox(height: 20),
                FAInputNumber(
                  textLeft: context.l10n.feet,
                  textRight: context.l10n.cm,
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
              onPressed: () => GoRouter.of(context).go('/levelScreen'),
            ),
          ),
        ],
      ),
    );
  }
}
