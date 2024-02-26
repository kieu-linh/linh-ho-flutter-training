import 'package:fitness_app/data/models/add_exercise_data.dart';
import 'package:fitness_app/data/seeds/add_exercise.dart';
import 'package:fitness_app/pages/exercise/bloc/exercise_bloc.dart';
import 'package:fitness_app/pages/exercise/bloc/exercise_event.dart';
import 'package:fitness_app/pages/exercise/provider/exercise_provider.dart';
import 'package:fitness_ui/components/card_container.dart';
import 'package:fitness_ui/components/divider.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  // This is delay fix
  List<AddExercise> _listExercise = AddExerciseSeeds.listAddExercise
      .where((e) => e.category == listCategoryExercise[0])
      .toList();

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return ExerciseProvider(
      child: BlocConsumer<ExerciseBloc, int>(
        listener: (context, state) {
          void showListExerciseByCategory(int index) {
            _listExercise = AddExerciseSeeds.listAddExercise
                .where((e) => e.category == listCategoryExercise[index])
                .toList();
          }
          showListExerciseByCategory(state);
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: context.padding(horizontal: 20),
                  child: FATopNavigation(
                    onLeadingPress: () =>
                        GoRouter.of(context).go('/homeScreen'),
                    title: s.fullExercise,
                  ),
                ),
                context.sizedBox(height: 22),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: context.padding(horizontal: 20),
                    child: Row(
                      children:
                          List.generate(listCategoryExercise.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<ExerciseBloc>()
                                .add(OnTapExercise(index));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 13),
                            padding:
                                context.padding(vertical: 12, horizontal: 25),
                            decoration: BoxDecoration(
                              color: state == index
                                  ? context.colorScheme.tertiary
                                  : context.colorScheme.onSurfaceVariant
                                      .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              listCategoryExercise[index],
                              style: state == index
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
                context.sizedBox(height: 28),
                Expanded(
                  child: ListView.separated(
                    padding: context.padding(horizontal: 20),
                    itemBuilder: (context, index) {
                      final addExercise = _listExercise[index];
                      return FACardContainer(
                        addExercise: addExercise,
                        onPressed: () {
                          GoRouter.of(context).goNamed(
                            'exerciseDetailScreen',
                            extra: addExercise,
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) => FADivider(
                      height: context.sizeHeight(40),
                      endIndent: 0,
                      indent: 0,
                    ),
                    itemCount: _listExercise.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
