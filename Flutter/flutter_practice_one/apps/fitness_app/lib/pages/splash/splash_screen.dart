import 'package:fitness_app/core/storage/shared_prefs.dart';
import 'package:fitness_app/pages/welcome/widget/image_filter.dart';
import 'package:fitness_ui/components/rich_text.dart';
import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Scaffold(
      body: Stack(
        children: [
          const FAImageFilter(
            image: FAImage.imgBackgroundSplash,
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(FAImage.imgSplash),
                const SizedBox(height: 42),
                FARichText(
                  fistText: s.firstTitleSplash,
                  secondText: s.secondTitleSplash,
                ),
                const SizedBox(height: 14),
                Text(
                  s.descriptionSplash,
                  textAlign: TextAlign.center,
                  style: context.textTheme.displayMedium,
                ),
                const SizedBox(height: 42),
                GestureDetector(
                  onTap: () async {
                    final user = await SharedPrefs().getAccount();
                    if (user == null) {
                      GoRouter.of(context).go('/welcomeScreen');
                    } else {
                      GoRouter.of(context).goNamed('homeScreen');
                    }
                  },
                  child: Container(
                    width: 180,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: context.colorScheme.tertiaryContainer,
                    ),
                    child: Center(
                      child: Text(
                        s.btnLetStart,
                        style: context.textTheme.displaySmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
