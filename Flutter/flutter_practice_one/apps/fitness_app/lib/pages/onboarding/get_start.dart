import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/constant/images.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/widgets/button.dart';
import 'package:flutter_practice_one/widgets/rich_text.dart';
import 'package:flutter_practice_one/widgets/top_control.dart';
import 'package:go_router/go_router.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                Text(
                  context.l10n.start,
                  style: context.textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.textStart,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleSmall,
                ),
                const SizedBox(height: 50),
                Image.asset(FAImage.imgStart),
                const SizedBox(height: 22),
                FARichText(
                  fistText: context.l10n.textFirstStart,
                  secondText: context.l10n.textSecondStart,
                  thirdText: context.l10n.textThirdStart,
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
              text: context.l10n.getStarted,
              onPressed: () => GoRouter.of(context).goNamed('homeScreen'),
              //context.goNamed('homeScreen'),
            ),
          ),
        ],
      ),
    );
  }
}
