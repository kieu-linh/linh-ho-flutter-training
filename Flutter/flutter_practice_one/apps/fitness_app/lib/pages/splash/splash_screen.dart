// ignore_for_file: prefer_final_locals

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/constant/images.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/widgets/image_filter.dart';
import 'package:flutter_practice_one/widgets/rich_text.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 2600), () {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      );

      GoRouter.of(context).go('/welcomeScreen');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  fistText: context.l10n.firstTitleSplash,
                  secondText: context.l10n.secondTitleSplash,
                ),
                const SizedBox(height: 14),
                Text(
                  context.l10n.descriptionSplash,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleMedium,
                ),
                const SizedBox(height: 42),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 180,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.tertiaryContainer,
                    ),
                    child: Center(
                      child: Text(
                        context.l10n.btnLetStart,
                        style: context.textTheme.headlineLarge,
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
