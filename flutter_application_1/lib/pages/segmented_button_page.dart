import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class SegmentedButtonPage extends StatefulWidget {
  const SegmentedButtonPage({super.key});

  @override
  State<SegmentedButtonPage> createState() => _SegmentedButtonPageState();
}

class _SegmentedButtonPageState extends State<SegmentedButtonPage>
    with TickerProviderStateMixin {
  List<bool> isSelected = [true, false, false];
  int value = 0;

  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addListener(() {
            setState(() {});
          });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(value: controller.value),
          const SizedBox(height: 20.0),
          CircularProgressIndicator(
            value: controller.value,
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              badges.Badge(
                badgeContent: Text(
                  '$value',
                  style: const TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                badgeAnimation: const badges.BadgeAnimation.scale(),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
              const SizedBox(width: 20.0),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    value++;
                  });
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          ToggleButtons(
            isSelected: isSelected,
            onPressed: (int index) {
              setState(() {
                isSelected =
                    List.generate(isSelected.length, (i) => i == index);
              });
            },
            children: const [
              Icon(Icons.home),
              Icon(Icons.business),
              Icon(Icons.school),
            ],
          ),
          const SizedBox(height: 20.0),
          const SnackBarExamPle(),
          const SizedBox(
            height: 20.0,
            child: Divider(
              height: 10,
              thickness: 0,
              color: Color.fromARGB(255, 243, 77, 77),
              indent: 200,
              endIndent: 200,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Alert Dialog Title'),
                    content: const Text('AlertDialog description'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text(
              'Show Alert Dialog',
              style: TextStyle(color: Color.fromARGB(255, 235, 121, 191)),
            ),
          ),
          const SizedBox(
            height: 20.0,
            child: Divider(
              height: 10,
              thickness: 1,
              color: Colors.blue,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 200.0),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close!'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Show Bottom Sheet'),
          ),
          const SizedBox(
            height: 20.0,
            child: Divider(
              height: 10,
              thickness: 5,
              color: Colors.grey,
              indent: 50,
              endIndent: 50,
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('Card Title'),
                  subtitle: Text('Subtitle'),
                ),
                ButtonBar(
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: const Text('ACTION 1'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('ACTION 2'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SnackBarExamPle extends StatelessWidget {
  const SnackBarExamPle({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('SnackBar is here!'),
            action: SnackBarAction(
              label: 'Action',
              onPressed: () {},
            ),
          ),
        );
      },
      child: const Text('Show Snackbar'),
    );
  }
}
