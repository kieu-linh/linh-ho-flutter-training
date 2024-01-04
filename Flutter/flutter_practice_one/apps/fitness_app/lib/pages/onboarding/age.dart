import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/top_control.dart';
import 'package:fitness_ui/components/top_onboarding.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FATopControl(
              onPressed: () => GoRouter.of(context).go('/favoriteScreen'),
              text: context.l10n.skipPage,
              onTap: () => GoRouter.of(context).go('/getStartScreen'),

            ),
            const SizedBox(height: 9),
            TopOnBoarding(currentStep: 2, title: context.l10n.yourOld),
            Expanded(
              child: SizedBox(
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
                          width: 70,
                          height: 40,
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: FAButton(
                text: context.l10n.btnNextStep,
                onPressed: () => GoRouter.of(context).go('/weightScreen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
