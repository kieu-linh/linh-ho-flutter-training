import 'package:fitness_app/data/models/macronutrient_goal_data.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FAMacronutrientGoal extends StatelessWidget {
  const FAMacronutrientGoal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Column(
      children: [
        Padding(
          padding: context.padding(left: 20, bottom: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.macronutrient,
                style: AppTextStyles.textButtonMedium.copyWith(
                  color: context.colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(listMacronutrientGoal.length, (index) {
            return Column(
              children: [
                Image.asset(listMacronutrientGoal[index].image ?? ''),
                const SizedBox(height: 10),
                FAText.bodyLarge(
                  context,
                  text: '${listMacronutrientGoal[index].title}',
                  style: context.textTheme.bodyLarge?.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 3),
                Text(
                  '${listMacronutrientGoal[index].gam}',
                  style:
                      context.textTheme.headlineSmall?.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 3),
                Text(
                  '${listMacronutrientGoal[index].description}',
                  style:
                      context.textTheme.displayMedium?.copyWith(fontSize: 10),
                ),
              ],
            );
          }),
        ),
        context.sizedBox(height: 40),
      ],
    );
  }
}
