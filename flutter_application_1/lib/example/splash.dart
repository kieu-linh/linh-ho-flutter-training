import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/example/time_picker.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2600), () {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ));

      Route route = MaterialPageRoute(builder: (context) => const TimePicker());
      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Image.asset(
        'assets/images/background.jpg',
        width: size.width,
        height: size.height,
        fit: BoxFit.fill,
      ),
    );
  }
}
