import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/data/models/category_data.dart';

class FAGoalItem extends StatelessWidget {
  const FAGoalItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        final s = FAUiS.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.titleGoal,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        const SizedBox(height: 23),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: List.generate(listCategory.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 19),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          listCategory[index].image ?? '',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        listCategory[index].name ?? '',
                        style:
                            context.textTheme.bodyLarge?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
