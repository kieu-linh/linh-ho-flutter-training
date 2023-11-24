import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    int sum = 0;
    int temp = int.parse(number);
    int size = number.length;
    while (temp != 0) {
      int d = temp % 10;
      sum += pow(d, size).toInt();
      temp = temp ~/ 10;
    }
    if (sum == int.parse(number)) {
      return true;
    } else {
      return false;
    }
  }
}
