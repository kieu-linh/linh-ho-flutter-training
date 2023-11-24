import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  //EX1
  stdout.write('What is your name?');
  String? name = stdin.readLineSync();
  stdout.write('What is your age?');
  int? age = int.parse(stdin.readLineSync() ?? '');
  int yearstoHunderd = 100 - age;
  print('$name have $yearstoHunderd years to be 100');
//EX2
  stdout.write('Enter thr number!');
  int number = int.parse(stdin.readLineSync() ?? '');
  if (number % 2 == 0) {
    print('$number is even');
  } else {
    print('$number is odd');
  }
  // EX3
  List numbers = [1, 3, 2, 54, 7, 5, 1, 0, 9, 67, 4];
  for (int i = 1; i <= numbers.length; i++) {
    if (numbers[i] <= 10) {
      print(numbers[i]);
    }
  }
  //EX4
  stdout.write('Enter the number!');
  int number1 = int.parse(stdin.readLineSync() ?? '');
  for (int i = 1; i <= number1; i++) {
    if (number1 % i == 0) {
      print('Nghiem cua $number1 is $i');
    }
  }
  //EX5
  List a = [1, 1, 2, 3, 5, 8, 13, 21, 34];
  Set set1 = a.toSet();
  List b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  Set set2 = b.toSet();
  // print(set1);
  Set values = {};
  for (var value in set1) {
    if (set2.contains(value)) {
      values.add(value);
    }
  }
  print(values.toList());
  //EX6
  stdout.write('Enter the a word! ');
  String st1 = stdin.readLineSync()?.toLowerCase() ?? '';
  String st2 = st1.split('').reversed.join();
  print(st1);
  print(st2);
  if (st1 != st2) {
    print('The word is not a palindrome');
  } else {
    print('The word is palindrome');
  }
  //EX7
  List a1 = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];
  List b1 = [];
  for (int i = 0; i < a1.length; i++) {
    if (a1[i] % 2 == 0) {
      b1.add(a1[i]);
    }
  }
  print(b1);
  //EX10
  stdout.write('Enter the number!');
  int a2 = int.parse(stdin.readLineSync() ?? '');
  if (checkSNT(a2)) {
    print('$a2 is a prime');
  } else {
    print('$a2 is not the prime');
  }
}

bool checkSNT(int n) {
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

void stringA() {
  final random = Random();
  List a = List.generate(10, (index) => random.nextInt(10));
  // List a = [1, 1, 23, 4, 2, 1, 2, 34, 4, 23, 5, 35, 4, 2, 6];
  Set b = a.toSet();
  print(b.toList());
}
