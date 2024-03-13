import 'package:fitness_app/features/onboarding/layout/scaffold.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final listText = [
      context.l10n.beginner,
      context.l10n.intermediate,
      context.l10n.advanced,
    ];

    return FAScaffold(
      onBack: () => context.go(AppRoutes.height.path),
      currentStep: 6,
      title: context.l10n.levelText,
      body: Column(
        children: [
          context.sizedBox(height: 140),
          ...List.generate(
            3,
            (index) {
              return Padding(
                padding: context.padding(vertical: 12),
                child: FAButton.outline(
                  onPressed: () {
                    _selectIndex = index;
                    setState(() {});
                  },
                  color: _selectIndex == index
                      ? context.colorScheme.tertiary
                      : context.colorScheme.onSecondary,
                  textStyle: _selectIndex == index
                      ? context.textTheme.bodyMedium
                      : context.textTheme.titleLarge?.copyWith(fontSize: 17),
                  text: listText[index],
                ),
              );
            },
          ),
        ],
      ),
      onNext: () => context.go(AppRoutes.goalScreen.path),
    );
  }
}
