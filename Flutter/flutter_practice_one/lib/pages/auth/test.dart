import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'PRO FITNESS',
      style: TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'BebasNeue',
        inherit: false
      ),
    );
  }
}
