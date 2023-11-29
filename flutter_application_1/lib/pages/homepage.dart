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
          Text(
            'Example Stack',
            style: TextStyle(
              color: Colors.pink.withOpacity(0.5),
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
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
        //  Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text('This is a Row1'),
        //         SizedBox(height: 20.0),
        //         Text('This is a Row2'),
        //         SizedBox(height: 20.0),
        //         Text('This is a Row3'),
        //         SizedBox(height: 20.0),
        //       ],
        //     ),
        //   ],
        // ),
        );
  }
}
