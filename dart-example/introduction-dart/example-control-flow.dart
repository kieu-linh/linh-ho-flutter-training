// example control flow
import 'dart:io';

void main() {
  int age = 20;

  // if-else
  if (age > 18) {
    stdout.write('You are adult');
  } else {
    stdout.write('You are not adult');
  }
  // for
  for (var i = 0; i < 10; i++) {
    stdout.write(i);
  }
  // while
  var i = 0;
  while (i < 10) {
    stdout.write(i);
    i++;
  }
  // do-while
  i = 0;
  do {
    stdout.write(i);
    i++;
  } while (i < 10);
  // switch-case
  switch (age) {
    case 18:
      stdout.write('You are 18');
      break;
    case 19:
      stdout.write('You are 19');
      break;
    default:
      stdout.write('You are not 18 or 19');
  }
  // break
  for (var i = 0; i < 10; i++) {
    if (i == 5) {
      break;
    }
    stdout.write(i);
  }
  // continue
  for (var i = 0; i < 10; i++) {
    if (i == 5) {
      continue;
    }
    stdout.write(i);
  }
}
