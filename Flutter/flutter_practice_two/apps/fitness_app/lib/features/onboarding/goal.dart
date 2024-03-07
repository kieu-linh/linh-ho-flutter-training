import 'package:fitness_app/features/onboarding/layout/scaffold.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
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
    final s = FAUiS.of(context);

    final listText = [
      s.weightLoss,
      s.gainMuscle,
      s.improveFitness,
    ];
    final listIcon = [
      FAIcon.iconWeightLoss,
      FAIcon.iconGainMuscle,
      FAIcon.iconFitness,
    ];

    return FAScaffold(
      onBack: () => GoRouter.of(context).go('/level'),
      currentStep: 7,
      title: s.goalText,
      body: Column(
        children: [
          context.sizedBox(height: 140),
          ...List.generate(3, (index) {
            return Padding(
              padding: context.padding(vertical: 12),
              child: FAButton.outline(
                onPressed: () {
                  _selectIndex = index;
                  setState(() {});
                },
                icon: listIcon[index],
                iconColor: _selectIndex == index
                    ? context.colorScheme.secondary
                    : context.colorScheme.surface,
                color: _selectIndex == index
                    ? context.colorScheme.tertiary
                    : context.colorScheme.onSecondary,
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
      onNext: () => GoRouter.of(context).go('/get-start'),
    );
  }
}
