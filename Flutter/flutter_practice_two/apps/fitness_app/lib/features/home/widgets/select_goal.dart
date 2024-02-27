import 'package:fitness_app/data/seeds/goal.dart';
import 'package:fitness_app/features/home/widgets/title.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FASelectGoal extends StatefulWidget {
  const FASelectGoal({
    super.key,
  });

  @override
  State<FASelectGoal> createState() => _FASelectGoalState();
}

class _FASelectGoalState extends State<FASelectGoal> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Column(
      children: [
        FATitleHome(title: s.selectGoal),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: context.padding(horizontal: 20),
            child: Row(
              children: List.generate(GoalSeeds.listGoal.length, (index) {
                return GestureDetector(
                  onTap: () {
                    _selectIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 13),
                    padding: context.padding(vertical: 10, horizontal: 6),
                    decoration: BoxDecoration(
                      color: _selectIndex == index
                          ? context.colorScheme.tertiary
                          : context.colorScheme.onSurfaceVariant
                              .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      GoalSeeds.listGoal[index].name ?? '',
                      style: _selectIndex == index
                          ? context.textTheme.labelMedium?.copyWith(
                              fontSize: 11,
                              color: context.colorScheme.secondary,
                            )
                          : context.textTheme.labelMedium
                              ?.copyWith(fontSize: 11),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        context.sizedBox(height: 28),
      ],
    );
  }
}
