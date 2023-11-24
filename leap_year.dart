import 'dart:io';

int getInt(String prompt) {
  int value = 0;
  bool isValid = false;
  do {
    try {
      stdout.write(prompt);
      value = int.parse(stdin.readLineSync().toString().trim());
      isValid = true;
    } on FormatException {
      stdout.write('Invalid input. Please enter a number');
    }
  } while (!isValid);
  return value;
}

void main() {
  int year = getInt('Enter the year!');
  if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
    print('$year is a leap year');
  } else {
    print('$year is not a leap year');
  }
}
