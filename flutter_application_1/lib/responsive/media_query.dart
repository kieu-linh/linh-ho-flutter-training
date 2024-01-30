import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Flutter App'),
      ),
      body: Center(
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.5,
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
  }
}
