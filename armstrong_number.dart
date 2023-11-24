import 'dart:io';
import 'dart:math';

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

bool isArmStrongNumber(int number) {
  int sum = 0;
  int temp = number;
  int size = number.toString().length;
  print(size);
  while (temp != 0) {
    int d = temp % 10;
    sum += pow(d, size).toInt();
    temp = temp ~/ 10;
  }
  print(sum);
  if (sum == number) {
    return true;
  } else {
    return false;
  }
}

void main() {
  int number = getInt('Enter a number! ');
  if (isArmStrongNumber(number)) {
    print('$number is armstrong number!');
  } else {
    print('$number is not armstrong number!');
  }
}
