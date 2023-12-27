import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/constant/icons.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/data/models/category_data.dart';
import 'package:flutter_practice_one/data/models/exercise_data.dart';
import 'package:flutter_practice_one/data/models/goal_model.dart';
import 'package:flutter_practice_one/data/models/meal_data.dart';
import 'package:flutter_practice_one/data/models/user_data.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/widgets/app_bar.dart';
import 'package:flutter_practice_one/widgets/bottom_nav_bar.dart';
import 'package:flutter_practice_one/widgets/card.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FAAppBar(
          user: user1,
          controller: searchController,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FACard(),
              FATitleHome(
                title: context.l10n.titleGoal,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: List.generate(listGoal.length, (index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 13),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color: context.colorScheme.onSurfaceVariant
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          listGoal[index].name ?? '',
                          style: context.textTheme.labelMedium
                              ?.copyWith(fontSize: 11),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              FATitleHome(
                title: context.l10n.category,
                titleSmall: context.l10n.seeAll,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: List.generate(listCategory.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 19),
                        child: Column(
                          children: [
                            Image.asset(listCategory[index].image ?? ''),
                            const SizedBox(height: 10),
                            Text(
                              listCategory[index].name ?? '',
                              style: context.textTheme.bodyLarge
                                  ?.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              const FADivider(height: 36),
              FATitleHome(
                title: context.l10n.descriptionPopularExercise,
                titleSmall: context.l10n.seeAll,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(listExercise[index].image ?? ''),
                          Positioned(
                            top: 12,
                            right: 23,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: context.colorScheme.secondary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: SvgPicture.asset(FAIcons.iconHeart),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listExercise[index].title ?? '',
                              style: context.textTheme.labelSmall
                                  ?.copyWith(fontSize: 12),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  listExercise[index].level ?? '',
                                  style: context.textTheme.bodySmall
                                      ?.copyWith(fontSize: 10),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width: 1,
                                  height: 8,
                                  color: context.colorScheme.outlineVariant,
                                ),
                                SvgPicture.asset(FAIcons.iconClock),
                                const SizedBox(width: 6),
                                Text(
                                  '${listExercise[index].time} min',
                                  style: context.textTheme.bodySmall
                                      ?.copyWith(fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const FADivider(height: 26);
                },
                itemCount: listExercise.length,
              ),
              const FADivider(height: 43),
              FATitleHome(
                title: context.l10n.mealPlans,
                titleSmall: context.l10n.seeAll,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(listMeal[index].image ?? ''),
                        const SizedBox(height: 11),
                        Text(
                          context.l10n.saladVegetables,
                          style: context.textTheme.labelSmall
                              ?.copyWith(fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${listMeal[index].kcal} kcal',
                          style: context.textTheme.bodySmall
                              ?.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const FADivider(height: 27),
                itemCount: listMeal.length,
              ),
              const FADivider(height: 46),
              FATitleHome(
                title: context.l10n.addExercise,
                titleSmall: context.l10n.seeAll,
              ),
            ],
          ),
        ),
        bottomNavigationBar: const FABottomNavBar());
  }
}

class FADivider extends StatelessWidget {
  const FADivider({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: context.colorScheme.onSurfaceVariant.withOpacity(0.15),
      indent: 20,
      endIndent: 20,
      height: height,
    );
  }
}

class FATitleHome extends StatelessWidget {
  const FATitleHome({
    required this.title,
    super.key,
    this.titleSmall,
  });

  final String title;
  final String? titleSmall;

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
            Text(
              titleSmall!,
              style: context.textTheme.labelSmall?.copyWith(fontSize: 12),
            ),
        ],
      ),
    );
  }
}
