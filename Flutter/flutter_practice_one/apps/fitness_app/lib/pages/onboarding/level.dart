import 'package:fitness_app/pages/onboarding/layout/scaffold.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
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
    final s = FAUiS.of(context);

    final listText = [
      s.beginner,
      s.intermediate,
      s.advanced,
    ];

    return FAScaffold(
      onBack: () => GoRouter.of(context).go('/heightScreen'),
      currentStep: 6,
      title: s.level,
      body: Column(
        children: [
          const SizedBox(height: 140),
          ...List.generate(
            3,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
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
      onNext: () => GoRouter.of(context).go('/goalScreen'),
    );
  }
}
