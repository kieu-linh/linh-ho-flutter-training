import 'dart:io';

class ExampleClass {
  String? name;
  int? age;
  String? address;
  double? height;
  bool? isStudent;

  ExampleClass(
      {this.name, this.age, this.address, this.height, this.isStudent});

  String getName() => name ?? '';
  int getAge() => age ?? 0;
  String getAddress() => address ?? '';
  double getHeight() => height ?? 0;
  bool getIsStudent() => isStudent ?? false;

  void setName(String name) => this.name = name;
  void setAge(int age) => this.age = age;
  void setAddress(String address) => this.address = address;
  void setHeight(double height) => this.height = height;
  void setIsStudent(bool isStudent) => this.isStudent = isStudent;

  @override
  String toString() {
    return 'Name: $name, Age: $age, Address: $address, Height: $height, isStudent: $isStudent';
  }
}

void main() {
  ExampleClass exampleClass = ExampleClass();
  exampleClass.setName('Linh');
  exampleClass.setAge(20);
  exampleClass.setAddress('Da Nang');
  exampleClass.setHeight(1.6);
  exampleClass.setIsStudent(true);
  stdout.write(exampleClass.toString());
}
