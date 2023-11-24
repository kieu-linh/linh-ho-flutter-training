import 'dart:io';

import 'package:student_manager/manager/student_manager.dart';
import 'package:student_manager/models/student_model.dart';
import 'package:student_manager/untils/menu_until.dart';
import 'package:student_manager/untils/validator.dart';

void main() {
  List<StudentModel> students = [];
  students.add(StudentModel.input('1', 'Linh', 20, 'Math', 'Quảng Trị', 9.0));
  students.add(StudentModel.input('2', 'Mai', 18, 'English', 'Quảng Nam', 8.5));
  students
      .add(StudentModel.input('3', 'Sang', 21, 'History', 'Quảng Ngãi', 8.7));
  students.add(StudentModel.input('4', 'Huy', 22, 'Physic', 'Quảng Ngãi', 9.9));
  students.add(StudentModel.input('5', 'Nam', 17, 'Math', 'Đà Nẵng', 7.5));

  StudentManager studentManager = StudentManager.inpput(students);
  int i;
  do {
    MenuUntil.printMenu();
    do {
      i = Validator().getInt('Choice: ');
      if ((i < 1) || (i > 6)) {
        print('Please enter a number from 1 to 6');
      }
    } while ((i < 1) || (i > 6));
    switch (i) {
      case 1:
        {
          studentManager.addStudent();
          print('Add student success');
          break;
        }
      case 2:
        {
          stdout.write('List student: \n');
          studentManager.showAllStudent();
          break;
        }
      case 3:
        {
          stdout.write('List student sort by medium score: \n');
          studentManager.sortStudentByMediumScore();
          break;
        }
      case 4:
        {
          studentManager.showAllCourseList();
          break;
        }
      case 5:
        {
          String searchText = Validator().getString('Enter id or name');
          studentManager.searchStudentByIdOrName(searchText);
          break;
        }
      case 6:
        {
          print('Exit!');
          break;
        }
    }
  } while (i != 6);
}
