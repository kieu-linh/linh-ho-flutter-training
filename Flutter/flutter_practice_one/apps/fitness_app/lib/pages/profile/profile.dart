import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/data/models/category_data.dart';
import 'package:flutter_practice_one/data/models/macronutrient_goal_data.dart';
import 'package:flutter_practice_one/data/models/user_data.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.paddingOf(context).top + 10,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FATopNavigation(
                  onPressLeft: () => GoRouter.of(context).go('/homeScreen'),
                  title: context.l10n.profile,
                  onPressRight: () {},
                  icon: FAIcons.iconEdit,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 46),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 52,
                          backgroundImage: AssetImage(user1.image ?? ''),
                        ),
                        const SizedBox(height: 13),
                        Text(
                          '${user1.name?.toUpperCase()}!',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.tertiaryContainer,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          context.l10n.basicMember,
                          style: context.textTheme.titleSmall
                              ?.copyWith(color: context.colorScheme.tertiary),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FAItem(
                        textFist: '${user1.weight}',
                        textSecond: context.l10n.kg,
                        textThird: context.l10n.weight,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        width: 1,
                        height: 20,
                        color: context.colorScheme.outlineVariant,
                      ),
                      FAItem(
                        textFist: '${user1.height}',
                        textSecond: context.l10n.cm,
                        textThird: context.l10n.height,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        width: 1,
                        height: 20,
                        color: context.colorScheme.outlineVariant,
                      ),
                      FAItem(
                        textFist: '${user1.age}',
                        textSecond: context.l10n.year,
                        textThird: context.l10n.age,
                      ),
                    ],
                  ),
                  const SizedBox(height: 33),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.titleGoal,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 23),
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
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    listCategory[index].image ?? '',
                                  ),
                                ),
                                //Image.asset(listCategory[index].image ?? ''),
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
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.macronutrient,
                          style: AppTextStyles.textButtonMedium
                              .copyWith(color: context.colorScheme.tertiary),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        List.generate(listMacronutrientGoal.length, (index) {
                      return Column(
                        children: [
                          Image.asset(listMacronutrientGoal[index].image ?? ''),
                          const SizedBox(height: 10),
                          Text(
                            '${listMacronutrientGoal[index].title}',
                            style: context.textTheme.bodyLarge
                                ?.copyWith(fontSize: 12),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${listMacronutrientGoal[index].gam}',
                            style: context.textTheme.headlineSmall
                                ?.copyWith(fontSize: 12),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${listMacronutrientGoal[index].description}',
                            style: context.textTheme.displayMedium
                                ?.copyWith(fontSize: 10),
                          ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAItem extends StatelessWidget {
  const FAItem({
    required this.textFist,
    required this.textSecond,
    required this.textThird,
    super.key,
  });

  final String textFist;
  final String textSecond;
  final String textThird;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: textFist,
            style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
            children: [
              TextSpan(
                text: textSecond.toLowerCase(),
                style: context.textTheme.titleMedium?.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          textThird,
          style: context.textTheme.titleMedium?.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}
