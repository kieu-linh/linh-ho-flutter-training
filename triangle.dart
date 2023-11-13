import 'dart:io';

void main() {
  stdout.write("Enter the maximum number: ");
  int maxNumber = int.parse(stdin.readLineSync()!);

  printTriangle(maxNumber);
}

void printTriangle(int maxNumber) {
  for (int i = 1; i <= maxNumber; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write('${j + i - 1} ');
    }
    print('');
  }
}