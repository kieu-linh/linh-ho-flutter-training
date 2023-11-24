import 'dart:io';

void printNumber(int numRows) {
  for (int i = 1; i <= numRows; i++) {
    for (int j = 1; j <= numRows - i; j++) {
      stdout.write(" ");
    }
    for (int k = 1; k <= i; k++) {
      stdout.write("$i ");
    }
    print('');
  }
}

void main() {
  stdout.write("Enter the number of rows:");
  int nums = int.parse(stdin.readLineSync()!);
  printNumber(nums);
}
