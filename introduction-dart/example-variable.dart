//example variable
import 'dart:io';

void main() {
  var name = 'Linh';
  var age = 20;
  var height = 1.7;
  var isStudent = true;
  var list = [1, 2, 3];
  var map = {'name': 'Linh', 'age': 20};

  stdout
      .write('Name: $name, Age: $age, Height: $height, isStudent: $isStudent');
  stdout.write('List: $list, Map: $map');
}
