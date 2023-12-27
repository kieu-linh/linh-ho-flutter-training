import 'package:flutter_practice_one/core/constant/images.dart';

class UserModel {
  UserModel();

  String? image;
  String? name;

}

UserModel user1 = UserModel()
  ..image = FAImage.imgAvatar
  ..name = 'Sophia';
