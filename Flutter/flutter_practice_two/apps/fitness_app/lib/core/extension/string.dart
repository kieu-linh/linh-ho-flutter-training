import 'package:flutter/material.dart';

class ChangeValue {
  static double toDouble(
    double saveValue,
    TextEditingController controller,
    double value,
  ) {
    if (controller.text == '') return 0;
    saveValue = saveValue * value;
    controller.text = saveValue.toStringAsFixed(2);

    return saveValue;
  }
}
