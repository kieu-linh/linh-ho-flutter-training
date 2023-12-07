import 'package:flutter/material.dart';

class AspectRatioPage extends StatelessWidget {
  const AspectRatioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Flutter App'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate aspect ratio based on screen width
          double aspectRatio = constraints.maxWidth / constraints.maxHeight;

          return Center(
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Hello, Responsive World!',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
