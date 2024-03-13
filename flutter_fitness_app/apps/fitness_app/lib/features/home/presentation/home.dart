import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/drawer/drawer_main.dart';
import 'package:fitness_app/features/home/bloc/home_bloc.dart';
import 'package:fitness_app/features/home/bloc/home_event.dart';
import 'package:fitness_app/features/home/bloc/home_state.dart';
import 'package:fitness_app/features/home/presentation/widgets/add_exercise.dart';
import 'package:fitness_app/features/home/presentation/widgets/category_item.dart';
import 'package:fitness_app/features/home/presentation/widgets/meal_plan.dart';
import 'package:fitness_app/features/home/presentation/widgets/popular_exercise.dart';
import 'package:fitness_app/features/home/presentation/widgets/select_goal.dart';
import 'package:fitness_app/features/home/presentation/widgets/title.dart';
import 'package:fitness_app/features/home/repositories/home_repositories.dart';
import 'package:fitness_ui/components/app_bar.dart';
import 'package:fitness_ui/components/card.dart';
import 'package:fitness_ui/components/shimmer.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(HomeRepository(context.read<ApiClient>()))
        ..add(HomeFetchGoalData())
        ..add(HomeFetchCategoryData())
        ..add(HomeFetchMealData())
        ..add(HomeFetchPopularExerciseData())
        ..add(HomeFetchAddExerciseData())
        ..add(HomeFetchUserData())
        ..add(HomeGoalOnTap()),
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return Scaffold(
            appBar: FAAppBar(
              onPressed: () => zoomDrawerController.toggle?.call(),
              name: '${state.user?.name} !',
            ),
            body: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FACard(),
                    FATitleHome(title: context.l10n.selectGoalText),
                    BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) =>
                          previous.fetchGoalStatus != current.fetchGoalStatus ||
                          previous.index != current.index,
                      builder: (context, state) {
                        switch (state.fetchGoalStatus) {
                          case SubmissionStatus.initial:
                            return SizedBox(height: 32);
                          case SubmissionStatus.loading:
                            return FAShimmer.goal();
                          case SubmissionStatus.success:
                            return FASelectGoal(
                              goals: state.goals,
                              selectIndex: state.index,
                              onTap: (index) => context.read<HomeBloc>().add(
                                    HomeGoalOnTap(index: index),
                                  ),
                            );
                          case SubmissionStatus.failure:
                            return Text('Error: ${state.errorMessage}');
                        }
                      },
                    ),
                    FATitleHome(
                      onPressed: () => GoRouter.of(context).goNamed('category'),
                      title: context.l10n.category,
                      titleSmall: context.l10n.seeAll,
                    ),
                    BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) =>
                          previous.fetchCategoryStatus !=
                          current.fetchCategoryStatus,
                      builder: (context, state) {
                        switch (state.fetchCategoryStatus) {
                          case SubmissionStatus.initial:
                            return SizedBox(height: 32);
                          case SubmissionStatus.loading:
                            return FAShimmer.category();
                          case SubmissionStatus.success:
                            return FACategoryItem(categories: state.categories);
                          case SubmissionStatus.failure:
                            return Text('Error: ${state.errorMessage}');
                        }
                      },
                    ),
                    FATitleHome(
                      title: context.l10n.popularExerciseDescription,
                      titleSmall: context.l10n.seeAll,
                    ),
                    BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) =>
                          previous.fetchPopularExerciseStatus !=
                          current.fetchPopularExerciseStatus,
                      builder: (context, state) {
                        switch (state.fetchPopularExerciseStatus) {
                          case SubmissionStatus.initial:
                            return SizedBox(height: 32);
                          case SubmissionStatus.loading:
                            return FAShimmer.meal();
                          case SubmissionStatus.success:
                            return FAPopularExercise(
                                popularExercise: state.popularExercises);
                          case SubmissionStatus.failure:
                            return Text('Error: ${state.errorMessage}');
                        }
                      },
                    ),
                    FATitleHome(
                        title: context.l10n.mealPlans,
                        titleSmall: context.l10n.seeAll),
                    BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) =>
                          previous.fetchMealStatus != current.fetchMealStatus,
                      builder: (context, state) {
                        switch (state.fetchMealStatus) {
                          case SubmissionStatus.initial:
                            return SizedBox(height: 32);
                          case SubmissionStatus.loading:
                            return FAShimmer.meal();
                          case SubmissionStatus.success:
                            return FAMealPlan(meals: state.meals);
                          case SubmissionStatus.failure:
                            return Text('Error: ${state.errorMessage}');
                        }
                      },
                    ),
                    FATitleHome(
                        title: context.l10n.addExerciseText,
                        titleSmall: context.l10n.seeAll),
                    BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) =>
                          previous.fetchAddExercisesStatus !=
                          current.fetchAddExercisesStatus,
                      builder: (context, state) {
                        switch (state.fetchAddExercisesStatus) {
                          case SubmissionStatus.initial:
                            return SizedBox(height: 32);
                          case SubmissionStatus.loading:
                            return FAShimmer.exercise();
                          case SubmissionStatus.success:
                            return FAAddExercise(
                                addExercises: state.addExercises);
                          case SubmissionStatus.failure:
                            return Text('Error: ${state.errorMessage}');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
