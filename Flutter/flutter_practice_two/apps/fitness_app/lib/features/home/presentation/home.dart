import 'package:fitness_app/features/drawer/drawer_main.dart';
import 'package:fitness_app/features/home/bloc/home_bloc.dart';
import 'package:fitness_app/features/home/bloc/home_event.dart';
import 'package:fitness_app/features/home/bloc/home_state.dart';
import 'package:fitness_app/features/home/presentation/widgets/add_exercise.dart';
import 'package:fitness_app/features/home/presentation/widgets/category_item.dart';
import 'package:fitness_app/features/home/presentation/widgets/meal_plan.dart';
import 'package:fitness_app/features/home/presentation/widgets/popular_exercise.dart';
import 'package:fitness_app/features/home/presentation/widgets/select_goal.dart';
import 'package:fitness_app/features/home/repositories/home_repositories.dart';
import 'package:fitness_ui/components/app_bar.dart';
import 'package:fitness_ui/components/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(RepositoryProvider.of<HomeRepository>(context))
            ..add(HomeFetchGoalData())
            ..add(HomeFetchCategoryData())
            ..add(HomeFetchMealData())
            ..add(HomeFetchPopularExerciseData())
            ..add(HomeFetchAddExerciseData()),
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.fetchGoalStatus != current,
        builder: (context, state) {
          // switch (state.fetchGoalStatus) {
          //   case SubmissionStatus.loading:
          //     //TODO: Add loading widget
          //     break;
          //   case SubmissionStatus.success:
          //    FASelectGoal(goals: state.goals ?? []);
          //   case SubmissionStatus.failure:
          //                  //TODO: Add loading widget
          //                  break;

          //   case SubmissionStatus.failure:
          //     break;
          //    case SubmissionStatus.initial:
          //     break;
          // }
          return Scaffold(
            appBar: FAAppBar(
              onPressed: () => zoomDrawerController.toggle?.call(),
              controller: searchController,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FACard(),
                  FASelectGoal(goals: state.goals ?? []),
                  FACategoryItem(categories: state.categories ?? []),
                  FAPopularExercise(
                      popularExercise: state.popularExercises ?? []),
                  FAMealPlan(meals: state.meals ?? []),
                  FAAddExercise(addExercises: state.addExercises ?? []),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
