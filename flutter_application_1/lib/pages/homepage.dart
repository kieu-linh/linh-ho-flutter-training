import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is a Row1'),
            SizedBox(height: 20.0),
            Text('This is a Row2'),
            SizedBox(height: 20.0),
            Text('This is a Row3'),
            SizedBox(height: 20.0),
          ],
        )
      ],
    )
    );
  }
}
