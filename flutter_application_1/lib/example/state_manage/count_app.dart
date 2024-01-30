import 'package:flutter/material.dart';

class CountApp extends StatefulWidget {
  const CountApp({super.key});

  @override
  State<CountApp> createState() => _CountAppState();
}

class _CountAppState extends State<CountApp> {
  int _counter = 0;


  /// This is simple example of state management in Flutter using StatefulWidget.
  void addNumber() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter:', style: TextStyle(fontSize: 24)),
            Text('$_counter', style: const TextStyle(fontSize: 48)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNumber,
        child: const Icon(Icons.add),
      ),
    );
  }
}
