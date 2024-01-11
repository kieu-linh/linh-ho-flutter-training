import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/pages/profile/widgets/goal_item.dart';
import 'package:flutter_practice_one/pages/profile/widgets/macronutrient_goal.dart';
import 'package:flutter_practice_one/pages/profile/widgets/user_info.dart';
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
    final s = FAUiS.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .copyWith(top: MediaQuery.paddingOf(context).top + 6),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FATopNavigation(
                onLeadingPress: () => GoRouter.of(context).go('/homeScreen'),
                padding: const EdgeInsets.only(top: 2),
                title: s.profile,
                onTrailingPress: () {},
                trailing: FAIcon.edit(),
              ),
              const Column(
                children: [
                  FAUserInfo(),
                  FAGoalItem(),
                  SizedBox(height: 24),
                  FAMacronutrientGoal(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
