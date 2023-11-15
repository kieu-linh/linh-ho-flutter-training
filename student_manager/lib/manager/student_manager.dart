import 'dart:io';

import 'package:student_manager/models/student_model.dart';

class StudentManager {
  List<StudentModel> _studentList = [];
  StudentManager();
  StudentManager.inpput(List<StudentModel> students) {
    _studentList = students;
  }
  void addStudent() {
    StudentModel studentModel = StudentModel();
    studentModel.inputInformation(_studentList);
    _studentList.add(studentModel);
  }

  void showAllStudent() {
    for (StudentModel st in _studentList) {
      print(st.toString());
    }
  }

  void sortStudentByMediumScore() {
    List<StudentModel> list = [..._studentList];
    list.sort((st1, st2) {
      if (st1.getMediumScore() > st2.getMediumScore()) {
        return 1;
      }
      if (st1.getMediumScore() > st2.getMediumScore()) {
        return -1;
      } else {
        return st1.getName().compareTo(st2.getName());
      }
    });
    for (StudentModel st in list) {
      print(st.toString());
    }
  }

  void showAllCourseList() {
    List<String> list = [];
    for (StudentModel student in _studentList) {
      list.add(student.getCourse());
    }
    list = list.toSet().toList();
    stdout.write('$list');
  }

  void searchStudentByIdOrName(String searchText) {
    searchText = searchText.toLowerCase();
    int count = 0;
    for (StudentModel st in _studentList) {
      if (st.getID().toLowerCase().contains(searchText) ||
          st.getName().toLowerCase().contains(searchText)) {
        print(st);
        count++;
      }
    }
    if (count == 0) {
      print('No matching results were found');
    } else {
      print('There are $count result');
    }
  }
}
