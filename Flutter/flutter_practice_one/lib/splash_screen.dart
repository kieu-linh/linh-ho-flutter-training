import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_practice_one/pages/welcome/welcome.dart';
import 'package:flutter_practice_one/widgets/image_filter.dart';
import 'package:flutter_practice_one/widgets/rich_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 2600), () {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));

      Route route =
          MaterialPageRoute(builder: (context) => const WelcomePage());
      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const FAImageFilter(
            image: 'assets/images/img_splash.png',
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/img_girl.png'),
                const SizedBox(height: 42),
                const FARichText(fistText: 'PRO ', secondText: 'FITNESS'),
                const SizedBox(height: 14),
                Text(
                  'We train your body to be \n great and fit.',
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
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xFF191919),
                    ),
                    child: Center(
                      child: Text(
                        'LET’S START',
                        style: AppTextStyles.textButton,
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
