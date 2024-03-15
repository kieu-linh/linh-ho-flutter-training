import 'package:api_client/api_client.dart';
import 'package:fitness_app/features/home/bloc/home_bloc.dart';
import 'package:fitness_app/features/home/bloc/home_event.dart';
import 'package:fitness_app/features/home/bloc/home_state.dart';
import 'package:fitness_app/features/home/repositories/home_repositories.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_app/seeds/user.dart';
import 'package:fitness_app/features/profile/widgets/goal_item.dart';
import 'package:fitness_app/features/profile/widgets/macronutrient_goal.dart';
import 'package:fitness_app/features/profile/widgets/user_info.dart';
import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) => HomeBloc(HomeRepository(context.read<ApiClient>()))
        ..add(HomeFetchUserData())
        ..add(HomeFetchCategoryData()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: context.padding(
                  horizontal: 20, top: MediaQuery.paddingOf(context).top + 6),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FATopNavigation(
                        onLeadingPress: () =>
                            context.go(AppRoutes.homeScreen.path),
                        padding: const EdgeInsets.only(top: 2),
                        title: context.l10n.profile,
                        onTrailingPress: () {},
                        trailing: FAIcons.edit(),
                      ),
                      Column(
                        children: [
                          FAUserInfo(
                            image: state.user?.avatar ?? UserSeeds.user1.image,
                            name: state.user?.name ?? '',
                            weight: state.user?.weight ?? 0.0,
                            height: state.user?.height ?? 0.0,
                            age: state.user?.age ?? 0,
                          ),
                          FAGoalItem(goals: state.categories),
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
        },
      ),
    );
  }
}
