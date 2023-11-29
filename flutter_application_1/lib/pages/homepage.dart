import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10.0)),
            width: 200,
            height: 200,
          ),
          // Text(
          //   'Example Stack',
          //   style: TextStyle(
          //     color: Colors.pink.withOpacity(0.5),
          //     fontSize: 20.0,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          const Positioned(
            top: 20,
            child: Icon(
              Icons.star,
              size: 100,
              color: Colors.yellow,
            ),
          )
        ],
      ),
    )
        );
  }
}
