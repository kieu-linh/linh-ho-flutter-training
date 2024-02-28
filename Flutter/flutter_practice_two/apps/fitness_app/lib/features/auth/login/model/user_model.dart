class User {
  User({
    this.userID,
    this.email,
    this.password,
  });
  int? userID;
  String? email;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'] as int?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'email': email,
      'password': password,
    };
  }
}
