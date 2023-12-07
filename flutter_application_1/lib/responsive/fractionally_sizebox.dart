import 'package:flutter/material.dart';

class Fractionally extends StatelessWidget {
  const Fractionally({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                FractionallySizedWidget(widthFactor: 0.4),
              ],
            ),
            Row(
              children: [
                FractionallySizedWidget(widthFactor: 0.6),
              ],
            ),
            Row(
              children: [
                FractionallySizedWidget(widthFactor: 0.8),
              ],
            ),
            Row(
              children: [
                FractionallySizedWidget(widthFactor: 1.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FractionallySizedWidget extends StatelessWidget {
  final double widthFactor;
  FractionallySizedWidget({required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: widthFactor,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink,
            border: Border.all(color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${widthFactor * 100}%',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
