class UserModel {
  UserModel({
    this.userId,
    this.email,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }
  String? userId;
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'password': password,
    };
  }
}
