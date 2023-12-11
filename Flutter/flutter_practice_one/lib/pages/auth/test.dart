import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'PRO FITNESS',
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        fontFamily: 'BebasNeue',
        inherit: false,
      ),
    );
  }
}
