import 'package:fitness_ui/core/constant/images.dart';

class UserModel {
  UserModel();

  String image = '';
  String name = '';
  double weight = 0;
  double height = 0;
  int age = 0;
}

UserModel user1 = UserModel()
  ..image = FAImage.imgAvatar
  ..name = 'Sophia'
  ..weight = 55
  ..height = 170
  ..age = 18;
