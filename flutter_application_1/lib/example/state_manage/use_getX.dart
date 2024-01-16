import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountNumberGetX extends StatelessWidget {
  const CountNumberGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('GetX Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<CounterController>(
                builder: (controller) {
                  return Text('Count: ${controller.count}', style: const TextStyle(fontSize: 24));
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.find<CounterController>().increment();
                },
                child: const Text('Increment'),
              ),
            ],
          ),
        ),
      );
  }
}


class CounterController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}