import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My App')),
      backgroundColor: Colors.grey,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.green[200],
            child: ElevatedButton(
              child: const Text('Do something'),
              onPressed: () {
                Provider.of<MyModel>(context, listen: false).doSomething();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(35),
            color: Colors.blue[200],
            child: Consumer<MyModel>(
              builder: (context, myModel, child) {
                return const Text('Show something');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  String text = "Hello";

  void doSomething() {
    text = "Hello World";
    notifyListeners();
  }
}
