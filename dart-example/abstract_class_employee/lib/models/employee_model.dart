import 'package:abstract_class_employee/utils/Validator.dart';

class EmployeeModel {
  static int increment = 0;
  int? code;
  String? name;
  int? age;
  String? phone;
  String? email;
  double? basicSalary;

  @override
  String toString() {
    return 'EmployeeModel{code: $code, name: $name, age: $age, phone: $phone, email: $email, basicSalary: $basicSalary}';
  }

  void printEmployee() {
    print(
        'EmployeeModel{code: $code, name: $name, age: $age, phone: $phone, email: $email, basicSalary: $basicSalary}');
  }

  EmployeeModel() {
    code = ++increment;
  }
  double getSalary() {
    return basicSalary ?? 0.0;
  }

  void inputInformation() {
    name = Validator.getString('Name: ');
    age = Validator.getInt('Tuoi: ');
    phone = Validator.getString('Phone: ');

    bool status;
    do {
      email = Validator.getString('Email: ');
      status = Validator.emailIsValid(email ?? '');
      if (!status) {
        print('Email is not valid, nhap lai email');
      }
    } while (!status);

    basicSalary = Validator.getDouble('Salary: ');
  }
}
