//example mixin in dart
mixin Person {
  String? name;
  int? age;
  String? address;
  double? height;

  String getName() => name ?? '';
  int getAge() => age ?? 0;
  String getAddress() => address ?? '';
  double getHeight() => height ?? 0;
  void setName(String name) => this.name = name;
  void setAge(int age) => this.age = age;
  void setAddress(String address) => this.address = address;
  void setHeight(double height) => this.height = height;

  @override
  String toString() {
    return 'Name: $name, Age: $age, Address: $address, Height: $height';
  }
}
class Student with Person {
  String? school;
  String? className;

  String getSchool() => school ?? '';
  String getClassName() => className ?? '';
  void setSchool(String school) => this.school = school;
  void setClassName(String className) => this.className = className;

  @override
  String toString() {
    return 'Name: $name, Age: $age, Address: $address, Height: $height, School: $school, Class: $className';
  }
}
void main() {
  Student student = Student();
  student.setName('Linh');
  student.setAge(20);
  student.setAddress('Da Nang');
  student.setHeight(1.6);
  student.setSchool('Su Pham');
  student.setClassName('CNTT');
  print(student.toString());
}