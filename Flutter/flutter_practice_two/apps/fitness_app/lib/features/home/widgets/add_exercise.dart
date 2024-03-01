import 'package:fitness_app/features/home/model/exercise.dart';
import 'package:fitness_app/features/home/widgets/title.dart';
import 'package:fitness_ui/components/card_container.dart';
import 'package:fitness_ui/components/divider.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FAAddExercise extends StatelessWidget {
  const FAAddExercise({
    required this.addExercises,
    super.key,
  });

  final List<Exercise> addExercises;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Column(
      children: [
        FATitleHome(
          title: s.addExercise,
          titleSmall: s.seeAll,
        ),
        ListView.separated(
          padding: context.padding(horizontal: 20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final addExercise = addExercises[index];
            return FACardContainer(addExercise: addExercise);
          },
          separatorBuilder: (context, index) => FADivider(
            height: context.sizeHeight(40),
            indent: 0,
            endIndent: 0,
          ),
          itemCount: addExercises.length,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
