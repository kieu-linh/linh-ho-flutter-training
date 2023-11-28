import 'package:flutter/material.dart';

class StatelessWidgetPage extends StatelessWidget {
  const StatelessWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_upward,
          size: 50,
          color: Colors.blue,
        ),
        Text(
          'Counter Value:',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '0',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.arrow_downward,
          size: 50,
          color: Colors.red,
        ),
      ],
    );
  }
}
