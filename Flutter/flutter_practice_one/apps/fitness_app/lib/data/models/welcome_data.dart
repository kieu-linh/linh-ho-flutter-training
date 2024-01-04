// Create class WelcomeData to store data for Welcome Screen
import 'package:fitness_ui/core/constant/images.dart';

class WelcomeData {
  WelcomeData();

  String? image;
  String? backgroundImage;
  String? firstText;
  String? secondText;
  String? thirdText;
}

//Create a WelcomeData list containing common data fields
List<WelcomeData> listWelcomes = [
  WelcomeData()
    ..image = FAImage.imgGirlFirst
    ..backgroundImage = FAImage.imgBackgroundFirst
    ..firstText = 'Perfect Body \n Doing '
    ..secondText = 'Crossfit \n'
    ..thirdText = 'Exercises',
  WelcomeData()
    ..image = FAImage.imgGirlSecond
    ..backgroundImage = FAImage.imgBackgroundSecond
    ..firstText = 'Shot Strong \n'
    ..secondText = 'Timeless \n'
    ..thirdText = 'Woman Training',
  WelcomeData()
    ..image = FAImage.imgGirlThird
    ..backgroundImage = FAImage.imgBackgroundThird
    ..firstText = 'Healthy Muscular \n'
    ..secondText = 'Sportswoman \n'
    ..thirdText = 'Standing',
];
