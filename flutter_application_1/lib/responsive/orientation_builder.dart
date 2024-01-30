import 'package:flutter/material.dart';

class OrientationExample extends StatelessWidget {
  const OrientationExample({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Flutter App'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: Container(
              width: orientation == Orientation.portrait
                  ? size.width * 0.8
                  : size.width * 0.5,
              height: orientation == Orientation.portrait
                  ? size.height * 0.5
                  : size.height * 0.8,
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
