import 'package:flutter/material.dart';

class StatefulWidgetPage extends StatefulWidget {
  const StatefulWidgetPage({super.key});

  @override
  State<StatefulWidgetPage> createState() => _StatefulWidgetPageState();
}

class _StatefulWidgetPageState extends State<StatefulWidgetPage> {
  bool showText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showText) const Text('Dynamic Text'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              showText = !showText;
            });
          },
          child: const Text('Toggle Text'),
        ),
      ],
    );
  }
}
