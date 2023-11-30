import 'package:flutter/material.dart';

class SegmentedButtonPage extends StatefulWidget {
  const SegmentedButtonPage({super.key});

  @override
  State<SegmentedButtonPage> createState() => _SegmentedButtonPageState();
}

class _SegmentedButtonPageState extends State<SegmentedButtonPage> {
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            isSelected = List.generate(isSelected.length, (i) => i == index);
          });
        },
        children: const [
          Icon(Icons.home),
          Icon(Icons.business),
          Icon(Icons.school),
        ],
      ),
    );
  }
}
