import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/widgets/button.dart';
import 'package:flutter_practice_one/widgets/top_control.dart';
import 'package:flutter_practice_one/widgets/top_onboarding.dart';
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

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FATopControl(
                  onPressed: () {},
                  text: context.l10n.skipPage,
                ),
                const SizedBox(height: 9),
                TopOnBoarding(title: context.l10n.level, currentStep: 6),
                const SizedBox(height: 140),
                ...List.generate(3, (index) {
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
                          : context.textTheme.titleLarge
                              ?.copyWith(fontSize: 17),
                      text: listText[index],
                    ),
                  );
                }),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: FAButton(
              text: context.l10n.btnNextStep,
              onPressed: () => GoRouter.of(context).go('/goalScreen'),
            ),
          ),
        ],
      ),
    );
  }
}
