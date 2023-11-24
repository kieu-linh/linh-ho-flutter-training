//function check snt
import 'dart:io';

bool checkSnt(int n) {
  if (n < 2) {
    return false;
  }
  for (int i = 2; i < n / 2; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  stdout.write('Enter a number: ');
  int n = int.parse(stdin.readLineSync() ?? '0');
  if (checkSnt(n)) {
    stdout.write('$n is prime number');
  } else {
    stdout.write('$n is not prime number');
  }
}
// comment in dart
 // comment 1

/* comment 2 */

/// comment 3

 /**
 * comment 4
 */


