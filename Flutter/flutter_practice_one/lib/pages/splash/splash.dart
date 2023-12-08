import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_one/pages/welcome/welcome.dart';
import 'package:flutter_practice_one/widgets/text_title.dart';

// Define the SplashPage widget
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

// Define the state for the SplashPage widget
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    //Set up Time Delay for Splash Screen to 2.6 seconds
    Timer(const Duration(milliseconds: 2600), () {
      //Set up System Overlay Style
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ));

      //Navigate to Welcome Page
      Route route =
          MaterialPageRoute(builder: (context) => const WelcomePage());
      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/splash-girl.png'),
            const SizedBox(height: 30.0),
            FAText(),
            const SizedBox(height: 14.0),
            const Text(
              'We train your body to be great and fit.',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 42.0),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 180.0,
                height: 56.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xFF191919),
                ),
                child: const Center(
                  child: Text(
                    'LET’S START',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
