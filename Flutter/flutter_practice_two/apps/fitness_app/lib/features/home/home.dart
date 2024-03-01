import 'package:fitness_app/features/drawer/drawer_main.dart';
import 'package:fitness_app/features/home/bloc/home_bloc.dart';
import 'package:fitness_app/features/home/bloc/home_event.dart';
import 'package:fitness_app/features/home/bloc/home_state.dart';
import 'package:fitness_app/features/home/widgets/add_exercise.dart';
import 'package:fitness_app/features/home/widgets/category_item.dart';
import 'package:fitness_app/features/home/widgets/meal_plan.dart';
import 'package:fitness_app/features/home/widgets/popular_exercise.dart';
import 'package:fitness_app/features/home/widgets/select_goal.dart';
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
      create: (context) => HomeBloc()
        ..add(HomeFetchGoalData())
        ..add(HomeFetchCategoryData())
        ..add(HomeFetchMealData())
        ..add(HomeFetchPopularExerciseData()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
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
                  FAAddExercise(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
