import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increaseCounter() {
    _counter++;
    notifyListeners(); // Notify about the change
  }
}

class ChangeValue extends StatefulWidget {
  const ChangeValue({super.key});

  @override
  State<ChangeValue> createState() => _ChangeValueState();
}

class _ChangeValueState extends State<ChangeValue> {
  final CounterModel counterModel = CounterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: ${counterModel.counter}'),
            ElevatedButton(
              onPressed: () {
                // Increase the value when the button is pressed
                counterModel.increaseCounter();
                print(counterModel.counter);
                //setState(() {});
              },
              child: const Text('Increase Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
