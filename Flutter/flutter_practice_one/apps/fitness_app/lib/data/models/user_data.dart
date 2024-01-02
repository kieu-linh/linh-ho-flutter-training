import 'package:flutter_practice_one/core/constant/images.dart';

class UserModel {
  UserModel();

  String? image;
  String? name;
  double? weight;
  double? height;
  int? age;
}

UserModel user1 = UserModel()
  ..image = FAImage.imgAvatar
  ..name = 'Sophia'
  ..weight = 55
  ..height = 170
  ..age = 18;
