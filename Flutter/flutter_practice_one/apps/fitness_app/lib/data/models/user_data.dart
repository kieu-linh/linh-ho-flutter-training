import 'package:fitness_ui/core/constant/images.dart';

class UserModel {
  UserModel();

  String? image;
  String? name;
  int? weight;
  int? height;
  int? age;
}

UserModel user1 = UserModel()
  ..image = FAImage.imgAvatar
  ..name = 'Sophia'
  ..weight = 55
  ..height = 170
  ..age = 18;
