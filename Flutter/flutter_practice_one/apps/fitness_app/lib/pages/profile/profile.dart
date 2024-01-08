import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/pages/profile/widgets/goal_item.dart';
import 'package:flutter_practice_one/pages/profile/widgets/macronutrient_goal.dart';
import 'package:flutter_practice_one/pages/profile/widgets/user_info.dart';
import 'package:flutter_svg/svg.dart';
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
                  onLeadingPress: () => GoRouter.of(context).go('/homeScreen'),
                  title: s.profile,
                  onTrailingPress: () {},
                  trailing: SvgPicture.asset(FAIcons.iconEdit),
                ),
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
