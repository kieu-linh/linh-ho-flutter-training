import 'dart:io';

class Validator {
  String getString(String prompt) {
    String value;
    do {
      stdout.write(prompt);
      value = stdin.readLineSync().toString().trim();
    } while (value.isEmpty);
    return value;
  }

  int getInt(String prompt) {
    int value = 0;
    bool isValid = false;
    do {
      try {
        stdout.write(prompt);
        value = int.parse(stdin.readLineSync().toString().trim());
        isValid = true;
      } on FormatException {
        stdout.write('Invalid input. Please enter a number: ');
      }
    } while (!isValid);
    return value;
  }

  double getDouble(String prompt) {
    double value = 0.0;
    bool isValid = false;
    do {
      try {
        stdout.write(prompt);
        value = double.parse(stdin.readLineSync().toString().trim());
        isValid = true;
      } on FormatException {
        stdout.write('Invalid input. Please enter a number: ');
      }
    } while (!isValid);
    return value;
  }
}
