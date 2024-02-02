import 'package:fitness_app/pages/onboarding/layout/scaffold.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return FAScaffold(
      onBack: () => GoRouter.of(context).go('/favoriteScreen'),
      currentStep: 2,
      title: s.yourOld,
      body: context.sizedBox(
        height: 300,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  width: context.sizeWidth(70),
                  height: context.sizeHeight(40),
                  decoration: BoxDecoration(
                    color: context.colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            ListWheelScrollView.useDelegate(
              diameterRatio: 1,
              physics: const FixedExtentScrollPhysics(),
              itemExtent: 40,
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 56,
                builder: (context, index) {
                  return Center(
                    child: Text(
                      '${index + 15}',
                      style: _selectIndex == index
                          ? context.textTheme.bodyMedium
                          : context.textTheme.labelMedium
                              ?.copyWith(fontSize: 18),
                    ),
                  );
                },
              ),
              onSelectedItemChanged: (value) {
                _selectIndex = value;
                setState(() {});
              },
            ),
          ],
        ),
      ),
      onNext: () => GoRouter.of(context).go('/weightScreen'),
    );
  }
}
