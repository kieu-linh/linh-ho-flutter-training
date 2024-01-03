import 'package:fitness_ui/components/card_container.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/data/models/add_exercise_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/pages/home/home.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
                return FACardContainer(
                  addExercise: addExercise,
                  onPressed: () {
                    GoRouter.of(context)
                        .goNamed('exerciseDetailScreen', extra: addExercise);
                  },
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
