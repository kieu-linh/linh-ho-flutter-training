import 'package:fitness_app/data/models/add_exercise_data.dart';
import 'package:fitness_ui/components/card_container.dart';
import 'package:fitness_ui/components/divider.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  List<AddExerciseModel> _listExercise = [];

  @override
  void initState() {
    showListExerciseByCategory(0);
    super.initState();
  }

  void showListExerciseByCategory(int index) {
    _listExercise = listAddExercise
        .where((e) => e.category == listCategoryExercise[index])
        .toList();
  }

  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FATopNavigation(
              onLeadingPress: () => GoRouter.of(context).go('/homeScreen'),
              title: s.fullExercise,
            ),
          ),
          const SizedBox(height: 22),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(listCategoryExercise.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      _selectIndex = index;
                      showListExerciseByCategory(index);
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 13),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 25,
                      ),
                      decoration: BoxDecoration(
                        color: _selectIndex == index
                            ? context.colorScheme.tertiary
                            : context.colorScheme.onSurfaceVariant
                                .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        listCategoryExercise[index],
                        style: _selectIndex == index
                            ? context.textTheme.titleLarge?.copyWith(
                                fontSize: 12,
                                color: context.colorScheme.secondary,
                              )
                            : context.textTheme.titleLarge
                                ?.copyWith(fontSize: 12),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                final addExercise = _listExercise[index];
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
              itemCount: _listExercise.length,
            ),
          ),
        ],
      ),
    );
  }
}
