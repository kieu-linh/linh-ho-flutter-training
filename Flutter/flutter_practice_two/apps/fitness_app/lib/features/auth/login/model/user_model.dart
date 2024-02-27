class User {
  User({
    this.userId,
    this.email,
    this.password,
  });
  String? userId;
  String? email;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'password': password,
    };
  }
}
