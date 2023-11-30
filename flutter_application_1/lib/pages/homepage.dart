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
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0)),
                width: 200,
                height: 200,
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
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              //Action to perform when the button is pressed
              print('Clicked me!');
            },
            child: const Text(
              'Elevated Button',
              style: TextStyle(color: Colors.pink),
            ),
          ),
          const SizedBox(height: 20.0),
          FilledButton(
            onPressed: () {
              print('Clicked FillButton!');
            },
            child: const Text(
              'Filled Button',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20.0),
          FilledButton.tonal(
              onPressed: () {
                print('Clicked Filled Tonal!');
              },
              child: const Text(
                'Filled Tonal',
                style: TextStyle(color: Colors.green),
              ))
        ],
      ),
    ));
  }
}
