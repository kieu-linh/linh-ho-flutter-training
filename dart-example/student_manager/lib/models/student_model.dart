import 'package:student_manager/untils/validator.dart';

class StudentModel {
  String _id = '';
  String _name = '';
  int _age = 0;
  String _course = '';
  String _address = '';
  double _mediumScore = 0.0;

  StudentModel();
  StudentModel.input(this._id, this._name, this._age, this._course,
      this._address, this._mediumScore);

  void setID(String id) => _id = id;
  String getID() => _id;
  void setName(String name) => _name = name;
  String getName() => _name;
  void setAge(int age) => _age = age;
  int getAge() => _age;
  void setCourse(String course) => _course = course;
  String getCourse() => _course;
  void setAddress(String address) => _address = address;
  String getAddress() => _address;
  void setMediumScore(double mediumScore) => _mediumScore = mediumScore;
  double getMediumScore() => _mediumScore;

  @override
  String toString() {
    return 'ID: $_id, Name: $_name, Age: $_age, Course: $_course, Address: $_address, MediumScore: $_mediumScore';
  }

  void inputInformation(List<StudentModel> students) {
    print('Enter information of student: ');
    bool isValid = false;
    do {
      _id = Validator().getString('Enter id: ');
      for (StudentModel st in students) {
        if (st.getID().toLowerCase() == _id.toLowerCase()) {
          print('ID is exist. Please enter again!');
          isValid = true;
          break;
        }
      }
    } while (!isValid);
  }
}
