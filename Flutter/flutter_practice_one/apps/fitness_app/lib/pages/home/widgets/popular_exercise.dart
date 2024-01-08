import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/data/models/exercise_data.dart';
import 'package:flutter_practice_one/pages/home/home.dart';
import 'package:flutter_svg/svg.dart';

class FAPopularExercise extends StatelessWidget {
  const FAPopularExercise({
    required this.s,
    super.key,
  });

  final FAUiS s;

  @override
  Widget build(BuildContext context) {
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
                      listExercise[index].image ?? '',
                    ),
                    Positioned(
                      top: 12,
                      right: 23,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: context.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(FAIcons.iconHeart),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FAText.bodySmall(
                        context,
                        text: listExercise[index].title ?? '',
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            listExercise[index].level ?? '',
                            style: context.textTheme.bodySmall
                                ?.copyWith(fontSize: 10),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 1,
                            height: 8,
                            color: context.colorScheme.outlineVariant,
                          ),
                          SvgPicture.asset(FAIcons.iconClock),
                          const SizedBox(width: 6),
                          Text(
                            '${listExercise[index].time} min',
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
            return const FADivider(height: 26);
          },
          itemCount: listExercise.length,
        ),
        const FADivider(height: 43),
      ],
    );
  }
}
