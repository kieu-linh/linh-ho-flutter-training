import 'package:fitness_app/data/seeds/exercise.dart';
import 'package:fitness_app/features/home/model/exercise.dart';
import 'package:fitness_app/features/home/presentation/widgets/title.dart';
import 'package:fitness_ui/components/divider.dart';
import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FAPopularExercise extends StatelessWidget {
  const FAPopularExercise({
    required this.popularExercise,
    super.key,
  });

  final List<Exercise> popularExercise;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Column(
      children: [
        FATitleHome(
          title: s.descriptionPopularExercise,
          titleSmall: s.seeAll,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      popularExercise[index].image ?? '',
                    ),
                    Positioned(
                      top: 12,
                      right: 23,
                      child: Container(
                        width: context.sizeWidth(24),
                        height: context.sizeHeight(24),
                        decoration: BoxDecoration(
                          color: context.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: context.padding(all: 6),
                          child: FAIcons.heart(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: context.padding(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FAText.bodySmall(
                        context,
                        text: popularExercise[index].title ?? '',
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            popularExercise[index].level ?? '',
                            style: context.textTheme.bodySmall
                                ?.copyWith(fontSize: 10),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 1,
                            height: 8,
                            color: context.colorScheme.outlineVariant,
                          ),
                          FAIcons.clock(),
                          const SizedBox(width: 6),
                          Text(
                            '${popularExercise[index].min} min',
                            style: context.textTheme.bodySmall
                                ?.copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return FADivider(height: context.sizeHeight(26));
          },
          itemCount: ExerciseSeeds.listExercise.length,
        ),
        FADivider(height: context.sizeHeight(43)),
      ],
    );
  }
}
