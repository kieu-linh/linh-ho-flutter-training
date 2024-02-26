import 'package:fitness_app/data/models/welcome_data.dart';
import 'package:fitness_ui/core/constant/images.dart';

class WelcomeSeeds {
  //Create a WelcomeData list containing common data fields
  static List<WelcomeData> listWelcomes = [
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
}
