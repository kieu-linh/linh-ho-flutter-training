class StudentModel {
  // text = name or unknow or null
  // String? name;
  // final text = name ?? 'unknow';
  // print(text); //unknow 

  // field can be null or not
  int? code;
  int? age;
  String? phone;
  String? email;
  double? basicSalary;

  // constructor
  StudentModel(
      {this.code,
      this.age,
      this.phone,
      this.email,
      this.basicSalary});

  // method
  void display() {
    print('Code: $code');
    print('Age: $age');
    print('Phone: $phone');
    print('Email: $email');
    print('Basic Salary: $basicSalary');
  }
}
