import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.username,
    required this.password,
    this.userId = '',
    this.userVerified = false,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String?,
      password: map['password'] as String?,
      userId: map['userId'] as String?,
      userVerified: map['userVerified'] as bool,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static const empty = UserModel(username: '', password: '');

  final String? username;
  final String? password;
  final String? userId;
  final bool userVerified;

  UserModel copyWith({
    String? username,
    String? password,
    String? userId,
    bool? userVerified,
  }) {
    return UserModel(
      username: username ?? this.username,
      password: password ?? this.password,
      userId: userId ?? this.userId,
      userVerified: userVerified ?? this.userVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'userId': userId,
      'userVerified': userVerified,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        username,
        password,
        userId,
        userVerified,
      ];
}
