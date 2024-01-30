import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int a = 0;
  double _volume = 0.0;
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
            ),
          ),
          const SizedBox(height: 20.0),
          OutlinedButton(
            onPressed: () => print('Clicked Outlined Button!'),
            child: const Text(
              'Outlined Button',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          const SizedBox(height: 20.0),
          TextButton(
            onPressed: () => print('Clicked Text Button!'),
            child: const Text(
              'Text Button',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    a++;
                  });
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10.0),
              Text('Number: $a')
            ],
          ),
          const SizedBox(height: 20.0),
          IconButton(
            onPressed: () {
              setState(() {
                _volume += 10;
              });
            },
            icon: const Icon(
              Icons.volume_up,
              color: Colors.pink,
              size: 20.0,
            ),
          ),
          Text('Volume: $_volume'),
        ],
      ),
    ));
  }
}
