import 'package:api_client/api_client.dart';
import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:fitness_app/features/onboarding/level/bloc/level_bloc.dart';
import 'package:fitness_app/features/onboarding/layout/scaffold.dart';
import 'package:fitness_app/features/onboarding/level/bloc/level_event.dart';
import 'package:fitness_app/features/onboarding/level/bloc/level_state.dart';
import 'package:fitness_app/features/onboarding/level/repository/level_repository.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LevelBloc(LevelRepository(context.read<ApiClient>()))
        ..add(LevelFetchData()),
      child: BlocBuilder<LevelBloc, LevelState>(
        builder: (context, state) {
          return FAScaffold(
            onBack: () => context.go(AppRoutes.height.path),
            currentStep: 6,
            title: context.l10n.levelText,
            body: Column(
              children: [
                context.sizedBox(height: 140),
                ...List.generate(
                  state.levels?.length ?? 0,
                  (index) {
                    return Padding(
                      padding: context.padding(vertical: 12),
                      child: FAButton.outline(
                          onPressed: () {
                            context.read<LevelBloc>().add(
                                  LevelOnTap(index: index),
                                );
                          },
                          color: state.index == index
                              ? context.colorScheme.tertiary
                              : context.colorScheme.onSecondary,
                          textStyle: state.index == index
                              ? context.textTheme.bodyMedium
                              : context.textTheme.titleLarge
                                  ?.copyWith(fontSize: 17),
                          text: state.levels?[index].name ?? ''),
                    );
                  },
                ),
              ],
            ),
            onNext: () {
              userStarted..levelID = state.levels?[state.index].levelID;
              context.go(AppRoutes.goalScreen.path);
            },
          );
        },
      ),
    );
  }
}
