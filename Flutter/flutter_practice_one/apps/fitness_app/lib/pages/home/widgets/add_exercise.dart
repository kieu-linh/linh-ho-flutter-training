import 'package:fitness_app/data/models/add_exercise_data.dart';
import 'package:fitness_app/pages/home/widgets/title.dart';
import 'package:fitness_ui/components/card_container.dart';
import 'package:fitness_ui/components/divider.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FAAddExercise extends StatelessWidget {
  const FAAddExercise({
    super.key,
  });

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final addExercise = listAddExercise[index];
            return FACardContainer(addExercise: addExercise);
          },
          separatorBuilder: (context, index) => const FADivider(
            height: 40,
            indent: 0,
            endIndent: 0,
          ),
          itemCount: listAddExercise.length,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
