// Create class WelcomeData to store data for Welcome Screen
import 'package:flutter_practice_one/core/constant/images.dart';

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
    ..image = FAImage.playerFirst
    ..backgroundImage = FAImage.backgroundWelcome1
    ..firstText = 'Perfect Body \n Doing '
    ..secondText = 'Crossfit \n'
    ..thirdText = 'Exercises',
  WelcomeData()
    ..image = FAImage.playerSecond
    ..backgroundImage = FAImage.backgroundWelcome2
    ..firstText = 'Shot Strong \n'
    ..secondText = 'Timeless \n'
    ..thirdText = 'Woman Training',
  WelcomeData()
    ..image = FAImage.playerThird
    ..backgroundImage = FAImage.backgroundWelcome3
    ..firstText = 'Healthy Muscular \n'
    ..secondText = 'Sportswoman \n'
    ..thirdText = 'Standing',
];
