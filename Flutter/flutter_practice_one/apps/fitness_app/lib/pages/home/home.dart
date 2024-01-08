import 'package:fitness_ui/components/app_bar.dart';
import 'package:fitness_ui/components/card.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/data/models/user_data.dart';
import 'package:flutter_practice_one/pages/home/widgets/add_exercise.dart';
import 'package:flutter_practice_one/pages/home/widgets/category_item.dart';
import 'package:flutter_practice_one/pages/home/widgets/meal_plan.dart';
import 'package:flutter_practice_one/pages/home/widgets/popular_exercise.dart';
import 'package:flutter_practice_one/pages/home/widgets/select_goal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.onTap});

  final VoidCallback? onTap;

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
        onPressed: widget.onTap,
        user: user1,
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

class FADivider extends StatelessWidget {
  const FADivider({
    super.key,
    this.height,
    this.indent = 20,
    this.endIndent = 20,
  });

  final double? height;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: context.colorScheme.onSurfaceVariant.withOpacity(0.15),
      indent: indent,
      endIndent: endIndent,
      height: height,
    );
  }
}

class FATitleHome extends StatelessWidget {
  const FATitleHome({
    required this.title,
    super.key,
    this.titleSmall,
    this.onPressed,
  });

  final String title;
  final String? titleSmall;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 16, right: 20),
      child: Row(
        children: [
          Text(
            title,
            style: context.textTheme.headlineLarge?.copyWith(fontSize: 18),
          ),
          const Spacer(),
          if (titleSmall != null)
            GestureDetector(
              onTap: onPressed,
              child: Text(
                titleSmall!,
                style: context.textTheme.labelSmall?.copyWith(fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
