import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/constant/icons.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/widgets/button.dart';
import 'package:flutter_practice_one/widgets/top_control.dart';
import 'package:flutter_practice_one/widgets/top_onboarding.dart';
import 'package:go_router/go_router.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final listText = [
      context.l10n.weightLoss,
      context.l10n.gainMuscle,
      context.l10n.improveFitness,
    ];
    final listIcon = [
      FAIcons.iconWeightLoss,
      FAIcons.iconGainMuscle,
      FAIcons.iconFitness,
    ];

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FATopControl(
                  onPressed: () {},
                  text: context.l10n.skipPage,
                ),
                const SizedBox(height: 9),
                TopOnBoarding(
                  title: context.l10n.goal,
                  currentStep: 7,
                ),
                const SizedBox(height: 140),
                ...List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: FAButton.outline(
                      onPressed: () {
                        _selectIndex = index;
                        setState(() {});
                      },
                      icon: listIcon[index],
                      color: _selectIndex == index
                          ? AppColor.tertiary
                          : AppColor.onSecondary,
                      textStyle: _selectIndex == index
                          ? AppTextStyles.textButtonGoal
                              .copyWith(color: context.colorScheme.onSecondary)
                          : AppTextStyles.textButtonGoal,
                      text: listText[index],
                    ),
                  );
                }),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: FAButton(
              text: context.l10n.finishStep,
              onPressed: () => GoRouter.of(context).go('/goalScreen'),
            ),
          ),
        ],
      ),
    );
  }
}
