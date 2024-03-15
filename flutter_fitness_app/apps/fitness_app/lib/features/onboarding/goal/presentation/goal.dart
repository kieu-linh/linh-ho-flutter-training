import 'package:api_client/api_client.dart';
import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:fitness_app/features/onboarding/Goal/repository/Goal_repository.dart';
import 'package:fitness_app/features/onboarding/goal/bloc/goal_bloc.dart';
import 'package:fitness_app/features/onboarding/goal/bloc/goal_event.dart';
import 'package:fitness_app/features/onboarding/goal/bloc/goal_state.dart';
import 'package:fitness_app/features/onboarding/layout/scaffold.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GoalPage extends StatelessWidget {
  const GoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoalBloc(GoalRepository(context.read<ApiClient>()))
        ..add(GoalFetchData()),
      child: BlocBuilder<GoalBloc, GoalState>(
        builder: (context, state) {
          return FAScaffold(
            onBack: () => context.go(AppRoutes.levelScreen.path),
            currentStep: 7,
            title: context.l10n.goalText,
            body: Column(
              children: [
                context.sizedBox(height: 140),
                ...List.generate(state.goals?.length ?? 0, (index) {
                  return Padding(
                    padding: context.padding(vertical: 12),
                    child: FAButton.outline(
                      onPressed: () => context.read<GoalBloc>().add(
                            GoalOnTap(index: index),
                          ),
                      icon: state.goals?[index].iconPath ?? '',
                      iconColor: state.index == index
                          ? context.colorScheme.secondary
                          : context.colorScheme.surface,
                      color: state.index == index
                          ? context.colorScheme.tertiary
                          : context.colorScheme.onSecondary,
                      textStyle: state.index == index
                          ? AppTextStyles.textButtonGoal
                              .copyWith(color: context.colorScheme.onSecondary)
                          : AppTextStyles.textButtonGoal,
                      text: state.goals?[index].name ?? '',
                    ),
                  );
                }),
              ],
            ),
            onNext: () {
              userStarted..goalID = state.goals?[state.index].goalID;
              print(userStarted.toJson());
              context.go(AppRoutes.getStartScreen.path);
            },
          );
        },
      ),
    );
  }
}
