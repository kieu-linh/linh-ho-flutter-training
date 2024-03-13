/// User model class that contains the user's information
/// [userID] is the user's id
/// [email] is the user's email
/// [password] is the user's password
/// [name] is the user's name
class User {
  User({
    this.userID,
    this.email,
    this.password,
    this.name,
  });
  int? userID;
  String? email;
  String? password;
  String? name;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'] as int?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'email': email,
      'password': password,
      'name': name,
    };
  }
}
