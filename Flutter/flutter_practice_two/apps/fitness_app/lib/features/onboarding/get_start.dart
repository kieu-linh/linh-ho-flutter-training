import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/rich_text.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 70),
            child: Column(
              children: [
                FATopNavigation(
                  onLeadingPress: () => GoRouter.of(context).go('/goal'),
                ),
                const Spacer(),
                FAText.displayLarge(context, text: context.l10n.startText),
                const SizedBox(height: 8),
                FAText.headlineSmall(
                  context,
                  text: context.l10n.startDescription,
                  textAlign: TextAlign.center,
                ),
                context.sizedBox(height: 50),
                Image.asset(FAImage.imgStart),
                context.sizedBox(height: 22),
                FARichText(
                  fistText: context.l10n.firstStartText,
                  secondText: context.l10n.secondStartText,
                  thirdText: context.l10n.thirdStartText,
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
              text: context.l10n.getStartedText,
              onPressed: () => GoRouter.of(context).goNamed('homeScreen'),
            ),
          ),
        ],
      ),
    );
  }
}
