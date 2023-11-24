import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Enter n number: ');
  int n = int.parse(stdin.readLineSync().toString().trim());
  int sum1 = pow((n * (n + 1)) / 2, 2).toInt();
  print(sum1);

  int sum2 = ((n * (n + 1) * (2 * n + 1)) ~/ 6).toInt();
  print(sum2);

  int result = sum1 - sum2;
  print('Result is $result');
}
