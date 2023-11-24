import 'package:abstract_class_employee/models/employee_model.dart';

class EmployeeManager {
  List<EmployeeModel> _employees = [];
  EmployeeManager();
  EmployeeManager.parameter(this._employees);

  void show() {
    for (EmployeeModel employee in _employees) {
      employee.printEmployee();
    }
  }
}
