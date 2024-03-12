import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/exercise/bloc/exercise_bloc.dart';
import 'package:fitness_app/features/exercise/bloc/exercise_event.dart';
import 'package:fitness_app/features/exercise/bloc/exercise_state.dart';
import 'package:fitness_app/features/exercise/repositories/exercise_repositories.dart';
import 'package:fitness_ui/components/card_container.dart';
import 'package:fitness_ui/components/divider.dart';
import 'package:fitness_ui/components/shimmer.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExerciseBloc(ExerciseRepository(context.read<ApiClient>()))
            ..add(ExerciseFetchBenefitData())
            ..add(ExerciseFetchExerciseData()),
      child: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {
          final listExercise = state.exercises.where((e) {
            return e.benefit?.benefitID ==
                state.benefits[state.index].benefitID;
          }).toList();
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: context.padding(horizontal: 20),
                  child: FATopNavigation(
                    onLeadingPress: () => GoRouter.of(context).go('/home'),
                    title: context.l10n.fullExercise,
                  ),
                ),
                context.sizedBox(height: 22),
                ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: context.padding(horizontal: 20),
                      child: Row(
                        children: List.generate(state.benefits.length, (index) {
                          return GestureDetector(
                            onTap: () => context
                                .read<ExerciseBloc>()
                                .add(ExerciseOnTap(index)),
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
                                state.benefits[index].title ?? '',
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
                ),
                context.sizedBox(height: 28),
                Expanded(
                  child: BlocBuilder<ExerciseBloc, ExerciseState>(
                    buildWhen: (previous, current) =>
                        previous.exercises != current.exercises,
                    builder: (context, state) {
                      switch (state.fetchExercisesStatus) {
                        case SubmissionStatus.initial:
                          return SizedBox(height: 32);
                        case SubmissionStatus.loading:
                          return FAShimmer.exercise();
                        case SubmissionStatus.success:
                          return ListView.separated(
                            padding: context.padding(horizontal: 20),
                            itemBuilder: (context, index) {
                              final exercise = listExercise[index];
                              return FACardContainer(
                                addExercise: exercise,
                                onPressed: () {
                                  GoRouter.of(context).goNamed(
                                    'exercise-detail',
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
                            itemCount: listExercise.length,
                          );
                        case SubmissionStatus.failure:
                          return SizedBox();
                      }
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
