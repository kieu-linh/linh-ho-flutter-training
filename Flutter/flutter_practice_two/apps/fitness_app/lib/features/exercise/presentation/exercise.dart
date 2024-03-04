import 'package:fitness_app/features/exercise/bloc/exercise_bloc.dart';
import 'package:fitness_app/features/exercise/bloc/exercise_event.dart';
import 'package:fitness_app/features/exercise/bloc/exercise_state.dart';
import 'package:fitness_app/features/exercise/repositories/exercise_repositories.dart';
import 'package:fitness_app/features/home/model/exercise.dart';
import 'package:fitness_ui/components/card_container.dart';
import 'package:fitness_ui/components/divider.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return BlocProvider(
      create: (context) =>
          ExerciseBloc(RepositoryProvider.of<ExerciseRepository>(context))
            ..add(ExerciseFetchBenefitData())
            ..add(ExerciseFetchExerciseData()),
      child: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {
          final listExercise = state.exercises?.where((e) {
            return e.benefit?.benefitID ==
                state.benefits![state.index].benefitID;
          }).toList();

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
                      children: List.generate(state.benefits!.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<ExerciseBloc>()
                                .add(ExerciseOnTap(index));

                            print('abc : ${state.benefits![index].benefitID}');
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 13),
                            padding:
                                context.padding(vertical: 12, horizontal: 25),
                            decoration: BoxDecoration(
                              color: state.index == index
                                  ? context.colorScheme.tertiary
                                  : context.colorScheme.onSurfaceVariant
                                      .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              state.benefits![index].title ?? '',
                              style: state.index == index
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
                  child: BlocBuilder<ExerciseBloc, ExerciseState>(
                    builder: (context, state) {
                      return ListView.separated(
                        padding: context.padding(horizontal: 20),
                        itemBuilder: (context, index) {
                          final exercise = listExercise?[index] ?? Exercise();
                          return FACardContainer(
                            addExercise: exercise,
                            onPressed: () {
                              GoRouter.of(context).goNamed(
                                'exerciseDetailScreen',
                                extra: exercise,
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) => FADivider(
                          height: context.sizeHeight(40),
                          endIndent: 0,
                          indent: 0,
                        ),
                        itemCount: listExercise?.length ?? 0,
                      );
                    },
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
