// ignore_for_file: deprecated_member_use

import 'package:fitness_ui/components/card_container.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/data/models/add_exercise_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/pages/home/home.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseDetailPage extends StatefulWidget {
  const ExerciseDetailPage({
    required this.exercise,
    super.key,
  });

  final AddExerciseModel exercise;
  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                widget.exercise.backgroundImage ?? '',
                width: MediaQuery.of(context).size.width,
                height: 379,
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 45),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ItemContainer(
                            widget: widget,
                            title: context.l10n.levelTitle,
                            text: widget.exercise.level,
                          ),
                          const SizedBox(height: 15),
                          ItemContainer(
                            widget: widget,
                            title: context.l10n.category,
                            text: widget.exercise.category,
                          ),
                          const SizedBox(height: 15),
                          ItemContainer(
                            widget: widget,
                            title: context.l10n.weight,
                            text: widget.exercise.weight,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.exercise.title ?? '',
                            style: context.textTheme.displaySmall
                                ?.copyWith(color: context.colorScheme.tertiary),
                          ),
                          const SizedBox(height: 9),
                          Text(
                            widget.exercise.description ?? '',
                            style: context.textTheme.titleSmall
                                ?.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 34),
                        child: Row(
                          children: [
                            Text(
                              context.l10n.exerciseDetail(
                                widget.exercise.weeks ?? 0,
                                widget.exercise.exerciseNumber ?? 0,
                              ),
                              style: context.textTheme.bodyLarge,
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                                vertical: 12,
                              ),
                              height: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: context.colorScheme.tertiary,
                              ),
                              child: Text(
                                context.l10n.schedule,
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontSize: 12,
                                  color: context.colorScheme.secondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(context.l10n.exerciseProgram),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20)
                              .copyWith(top: 20, bottom: 35),
                          child: Row(
                            children: List.generate(listCategoryExercise.length,
                                (index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 13),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 25,
                                ),
                                decoration: BoxDecoration(
                                  color: context.colorScheme.onSurfaceVariant
                                      .withOpacity(0.1),
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
                      ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final addExercise = listAddExercise[index];
                          return FACardContainer(
                            addExercise: addExercise,
                            onPressed: () {},
                          );
                        },
                        separatorBuilder: (context, index) => const FADivider(
                          height: 40,
                          endIndent: 0,
                          indent: 0,
                        ),
                        itemCount: listAddExercise.length,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 349,
            left: 20,
            right: 20,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      FAIcons.iconCalories,
                      color: context.colorScheme.tertiary,
                      height: 22,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${widget.exercise.kcal} kcal',
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: context.colorScheme.tertiary),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      width: 1,
                      height: 16,
                      color: context.colorScheme.outlineVariant,
                    ),
                    SvgPicture.asset(
                      FAIcons.iconClock,
                      color: context.colorScheme.tertiary,
                      height: 22,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${widget.exercise.min} min',
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: context.colorScheme.tertiary),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    required this.widget,
    this.title,
    this.text,
    super.key,
  });

  final ExerciseDetailPage widget;
  final String? title;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title ?? '',
          style: context.textTheme.labelMedium?.copyWith(fontSize: 10),
        ),
        const SizedBox(height: 6),
        Container(
          margin: const EdgeInsets.only(right: 13),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 25,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.onSurfaceVariant.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            text ?? '',
            style: context.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
