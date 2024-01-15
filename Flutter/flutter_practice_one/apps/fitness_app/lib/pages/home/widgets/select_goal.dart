import 'package:fitness_app/data/models/goal_data.dart';
import 'package:fitness_app/pages/home/widgets/title.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FASelectGoal extends StatefulWidget {
  const FASelectGoal({
    required this.s,
    super.key,
  });

  final FAUiS s;

  @override
  State<FASelectGoal> createState() => _FASelectGoalState();
}

class _FASelectGoalState extends State<FASelectGoal> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FATitleHome(title: widget.s.selectGoal),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: List.generate(listGoal.length, (index) {
                return GestureDetector(
                  onTap: () {
                    _selectIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 13),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _selectIndex == index
                          ? context.colorScheme.tertiary
                          : context.colorScheme.onSurfaceVariant
                              .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      listGoal[index].name ?? '',
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
        const SizedBox(height: 28),
      ],
    );
  }
}
