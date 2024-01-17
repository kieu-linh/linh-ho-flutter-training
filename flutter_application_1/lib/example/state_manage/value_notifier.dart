import 'package:flutter/material.dart';

class CountValue extends StatelessWidget {
  const CountValue({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> counter = ValueNotifier<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: ${counter.value}'),
            ElevatedButton(
              onPressed: () {
                // Add 1 to counter value
                counter.value++;
                print(counter.value);
              },
              child: const Text('Increase Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
