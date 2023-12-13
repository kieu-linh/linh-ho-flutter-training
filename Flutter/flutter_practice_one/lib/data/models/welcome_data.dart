// Create class WelcomeData to store data for Welcome Screen
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
    ..image = 'assets/images/girl_welcome1.png'
    ..backgroundImage = 'assets/images/img_welcome1.jpg'
    ..firstText = 'Perfect Body \n Doing '
    ..secondText = 'Crossfit \n'
    ..thirdText = 'Exercises',
  WelcomeData()
    ..image = 'assets/images/girl_welcome2.png'
    ..backgroundImage = 'assets/images/img_welcome2.png'
    ..firstText = 'Shot Strong \n'
    ..secondText = 'Timeless \n'
    ..thirdText = 'Woman Training',
  WelcomeData()
    ..image = 'assets/images/girl_welcome3.png'
    ..backgroundImage = 'assets/images/img_welcome3.png'
    ..firstText = 'Healthy Muscular \n'
    ..secondText = 'Sportswoman \n'
    ..thirdText = 'Standing',
];
