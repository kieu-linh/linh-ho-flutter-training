import 'package:fitness_app/seeds/user.dart';
import 'package:fitness_app/features/profile/widgets/goal_item.dart';
import 'package:fitness_app/features/profile/widgets/macronutrient_goal.dart';
import 'package:fitness_app/features/profile/widgets/user_info.dart';
import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
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
      body: Padding(
        padding: context.padding(
            horizontal: 20, top: MediaQuery.paddingOf(context).top + 6),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FATopNavigation(
                  onLeadingPress: () => GoRouter.of(context).go('/home'),
                  padding: const EdgeInsets.only(top: 2),
                  title: context.l10n.profile,
                  onTrailingPress: () {},
                  trailing: FAIcons.edit(),
                ),
                Column(
                  children: [
                    FAUserInfo(
                      image: UserSeeds.user1.image,
                      name: UserSeeds.user1.name,
                      weight: UserSeeds.user1.weight,
                      height: UserSeeds.user1.height,
                      age: UserSeeds.user1.age,
                    ),
                    const FAGoalItem(),
                    context.sizedBox(height: 24),
                    const FAMacronutrientGoal(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
