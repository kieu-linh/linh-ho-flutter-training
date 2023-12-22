import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FATopControl(
                  onPressed: () {},
                  text: context.l10n.skipPage,
                ),
                const SizedBox(height: 20),
                TopOnBoarding(
                  title: context.l10n.level,
                  currentStep: 6,
                ),
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
                          ? AppColor.tertiary
                          : AppColor.onSecondary,
                      textStyle: _selectIndex == index
                          ? AppTextStyles.textButtonMedium
                          : AppTextStyles.textButtonSmall
                              .copyWith(fontSize: 17),
                      text: listText[index],
                    ),
                    /*: FAButton(
                            onPressed: () {},
                            text: listText[index],
                            color: AppColor.tertiary,
                          ),*/
                  );
                }),
                /*FAButton(
                  color: AppColor.tertiary,
                  text: context.l10n.beginner,
                  onPressed: () {}, 
                ),
                const SizedBox(height: 25),
                FAButton.outline(
                  textStyle:
                      AppTextStyles.textButtonSmall.copyWith(fontSize: 17),
                  text: context.l10n.intermediate,
                  onPressed: () {},
                ),
                const SizedBox(height: 25),
                FAButton.outline(
                  textStyle:
                      AppTextStyles.textButtonSmall.copyWith(fontSize: 17),
                  text: context.l10n.advanced,
                  onPressed: () {},
                ),*/
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
