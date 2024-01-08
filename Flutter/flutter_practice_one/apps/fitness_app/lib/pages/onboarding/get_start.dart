import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/rich_text.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_control.dart';
import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 70),
            child: Column(
              children: [
                FATopControl(
                  onPressed: () => GoRouter.of(context).go('/goalScreen'),
                ),
                const Spacer(),
                FAText.displayLarge(context, text: s.start),
                const SizedBox(height: 8),
                Text(
                  s.textStart,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleSmall,
                ),
                const SizedBox(height: 50),
                Image.asset(FAImage.imgStart),
                const SizedBox(height: 22),
                FARichText(
                  fistText: s.textFirstStart,
                  secondText: s.textSecondStart,
                  thirdText: s.textThirdStart,
                  textStyleFirst: context.textTheme.displayMedium,
                  textStyleSecond: context.textTheme.displayMedium
                      ?.copyWith(color: context.colorScheme.primary),
                ),
                const Spacer(),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: FAButton(
              text: s.getStarted,
              onPressed: () => GoRouter.of(context).goNamed('homeScreen'),
              //context.goNamed('homeScreen'),
            ),
          ),
        ],
      ),
    );
  }
}
