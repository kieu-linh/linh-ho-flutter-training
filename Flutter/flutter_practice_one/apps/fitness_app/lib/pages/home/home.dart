import 'package:fitness_app/pages/drawer/drawer_main.dart';
import 'package:fitness_app/pages/home/widgets/add_exercise.dart';
import 'package:fitness_app/pages/home/widgets/category_item.dart';
import 'package:fitness_app/pages/home/widgets/meal_plan.dart';
import 'package:fitness_app/pages/home/widgets/popular_exercise.dart';
import 'package:fitness_app/pages/home/widgets/select_goal.dart';
import 'package:fitness_ui/components/app_bar.dart';
import 'package:fitness_ui/components/card.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
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
    final s = FAUiS.of(context);

    return Scaffold(
      appBar: FAAppBar(
        onPressed: () {
          zoomDrawerController.toggle?.call();
        },
        controller: searchController,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FACard(),
            FASelectGoal(s: s),
            FACategoryItem(s: s),
            FAPopularExercise(s: s),
            FAMealPlan(s: s),
            FAAddExercise(s: s),
          ],
        ),
      ),
    );
  }
}
