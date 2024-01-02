import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/data/models/add_exercise_data.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/pages/home/home.dart';
import 'package:flutter_svg/svg.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20)
                .copyWith(top: MediaQuery.of(context).padding.top + 5),
            child: Row(
              children: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: SvgPicture.asset(FAIcons.iconBack),
                  ),
                ),
                const Spacer(),
                Text(
                  context.l10n.exercise.toUpperCase(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.tertiaryContainer,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 22),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(listCategoryExercise.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 13),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 25,
                    ),
                    decoration: BoxDecoration(
                      color:
                          context.colorScheme.onSurfaceVariant.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      listCategoryExercise[index],
                      style: context.textTheme.bodySmall,
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              //physics: const NeverScrollableScrollPhysics(),
              //shrinkWrap: true,
              itemBuilder: (context, index) {
                final addExercise = listAddExercise[index];
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: addExercise.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        addExercise.image ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            addExercise.description ?? '',
                            style: context.textTheme.labelSmall
                                ?.copyWith(fontSize: 12),
                          ),
                          const SizedBox(height: 13),
                          Row(
                            children: [
                              SvgPicture.asset(FAIcons.iconCalories),
                              const SizedBox(width: 7),
                              Text(
                                '${addExercise.kcal} kcal',
                                style: context.textTheme.bodySmall
                                    ?.copyWith(fontSize: 10),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                width: 1,
                                height: 8,
                                color: context.colorScheme.outlineVariant,
                              ),
                              SvgPicture.asset(FAIcons.iconClock),
                              const SizedBox(width: 6),
                              Text(
                                '${addExercise.min} min',
                                style: context.textTheme.bodySmall
                                    ?.copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                          const SizedBox(height: 9),
                          Text(
                            addExercise.level ?? '',
                            style: context.textTheme.bodySmall
                                ?.copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const FADivider(
                height: 40,
                endIndent: 0,
                indent: 0,
              ),
              itemCount: listAddExercise.length,
            ),
          ),
        ],
      ),
    );
  }
}
