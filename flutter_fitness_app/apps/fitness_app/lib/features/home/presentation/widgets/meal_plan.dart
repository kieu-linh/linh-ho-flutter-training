import 'package:fitness_app/features/home/model/meal.dart';
import 'package:fitness_ui/components/divider.dart';
import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';

class FAMealPlan extends StatelessWidget {
  const FAMealPlan({
    required this.meals,
    super.key,
  });

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(meals[index].imagePath ?? '', fit: BoxFit.cover),
                const SizedBox(height: 11),
                FAText.bodySmall(context, text: meals[index].description ?? ''),
                const SizedBox(height: 5),
                Row(
                  children: [
                    FAIcons.calories(),
                    const SizedBox(width: 7),
                    Text(
                      '${meals[index].kcal} kcal',
                      style:
                          context.textTheme.bodySmall?.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const FADivider(
            height: 27,
            endIndent: 0,
            indent: 0,
          ),
          itemCount: meals.length,
        ),
        FADivider(height: context.sizeHeight(46)),
      ],
    );
  }
}
