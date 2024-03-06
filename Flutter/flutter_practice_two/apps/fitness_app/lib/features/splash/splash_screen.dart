import 'package:fitness_app/core/storage/shared_prefs.dart';
import 'package:fitness_app/features/welcome/widget/image_filter.dart';
import 'package:fitness_ui/components/rich_text.dart';
import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                context.sizedBox(height: 42),
                FARichText(
                  fistText: s.firstSplashTitle,
                  secondText: s.secondSplashTitle,
                ),
                const SizedBox(height: 14),
                Text(
                  s.splashDescription,
                  textAlign: TextAlign.center,
                  style: context.textTheme.displayMedium,
                ),
                context.sizedBox(height: 42),
                GestureDetector(
                  onTap: () async {
                    final user = await context.read<SharedPrefs>().getAccount();
                    if (user == null) {
                      GoRouter.of(context).go('/welcomeScreen');
                    } else {
                      GoRouter.of(context).goNamed('homeScreen');
                    }
                  },
                  child: Container(
                    width: context.sizeWidth(180),
                    height: context.sizeHeight(56),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: context.colorScheme.tertiaryContainer,
                    ),
                    child: Center(
                      child: Text(
                        s.buttonStartText,
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
