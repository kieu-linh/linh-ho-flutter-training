import 'package:fitness_app/features/drawer/drawer_main.dart';
import 'package:fitness_app/features/home/widgets/add_exercise.dart';
import 'package:fitness_app/features/home/widgets/category_item.dart';
import 'package:fitness_app/features/home/widgets/meal_plan.dart';
import 'package:fitness_app/features/home/widgets/popular_exercise.dart';
import 'package:fitness_app/features/home/widgets/select_goal.dart';
import 'package:fitness_ui/components/app_bar.dart';
import 'package:fitness_ui/components/card.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: FAAppBar(
        onPressed: () => zoomDrawerController.toggle?.call(),
        controller: searchController,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FACard(),
            FASelectGoal(),
            FACategoryItem(),
            FAPopularExercise(),
            FAMealPlan(),
            FAAddExercise(),
          ],
        ),
      ),
    );
  }
}
