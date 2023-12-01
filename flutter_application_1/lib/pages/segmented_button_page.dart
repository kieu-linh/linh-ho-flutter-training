import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class SegmentedButtonPage extends StatefulWidget {
  const SegmentedButtonPage({super.key});

  @override
  State<SegmentedButtonPage> createState() => _SegmentedButtonPageState();
}

class _SegmentedButtonPageState extends State<SegmentedButtonPage> {
  List<bool> isSelected = [true, false, false];
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
        ],
      ),
    );
  }
}
