import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  DateTime _dateTime = DateTime.now();
  double _rating = 20;
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool isSwitched = false;

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

  void _showTimePicker() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (timeOfDay != null) {
      setState(() {
        _selectedTime = timeOfDay;
      });
    }
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
            const SizedBox(height: 20.0),
            Slider(
              value: _rating,
              max: 100,
              min: 0,
              divisions: 5,
              label: _rating.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _rating = value;
                });
              },
            ),
            Text("${_selectedTime.hour}:${_selectedTime.minute}",
                style: const TextStyle(fontSize: 20.0)),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _showTimePicker,
              child: const Text(
                'Choose Time',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 25.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
