// Create a class extends InheritedWidget
import 'package:flutter/material.dart';

class MyExample extends InheritedWidget {
  final int data;
  final Function(int) onChanged;

  const MyExample({
    super.key,
    required this.onChanged,
    required this.data,
    required Widget child,
  }) : super(child: child);

  //function search through context to access the data
  static MyExample of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyExample>()!;
  }

  // This function called when update data
  void updateData(int newData) {
    onChanged(newData);
  }

  @override
  bool updateShouldNotify(MyExample oldWidget) {
    // return true to notify framework to rebuild widgets
    return data != oldWidget.data;
  }
}

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //Use MyExample to display data
    final data1 = MyExample.of(context).data;

    return Text('Data from InheritedWidget: $data1');
  }
}

//widget to change data and notify framework to rebuild widgets
class ChangeData extends StatelessWidget {
  const ChangeData({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        MyExample.of(context).updateData(30);
      },
      child: const Text('Change data'),
    );
  }
}

class UpdateData extends StatelessWidget {
  const UpdateData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget Example'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DisplayWidget(),
          SizedBox(height: 20),
          ChangeData(),
        ],
      ),
    );
  }
}
