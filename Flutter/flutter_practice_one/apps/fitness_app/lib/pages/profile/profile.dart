import 'package:fitness_app/data/models/user_data.dart';
import 'package:fitness_app/pages/profile/widgets/goal_item.dart';
import 'package:fitness_app/pages/profile/widgets/macronutrient_goal.dart';
import 'package:fitness_app/pages/profile/widgets/user_info.dart';
import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
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
              Column(
                children: [
                  FAUserInfo(
                    image: user1.image,
                    name: user1.name,
                    weight: user1.weight,
                    height: user1.height,
                    age: user1.age,
                  ),
                  const FAGoalItem(),
                  const SizedBox(height: 24),
                  const FAMacronutrientGoal(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
