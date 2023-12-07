import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Flutter App'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              width: constraints.maxWidth * 0.8,
              height: constraints.maxHeight * 0.5,
              color: Colors.green,
              child: const Center(
                child: Text(
                  'Hello, Responsive World!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
