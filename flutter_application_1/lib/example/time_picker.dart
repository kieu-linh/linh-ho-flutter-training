import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2002),
      lastDate: DateTime(2024),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_dateTime.toString(), style: const TextStyle(fontSize: 20.0)),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _showDatePicker,
              child: const Text(
                'Choose Date',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
