// Create class FAConstant to store data for Welcome Screen
import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';

class FAConstant {
  FAConstant();

  String? image;
  String? backgroundImage;
  String? firstText;
  String? secondText;
  String? thirdText;
}

List<FAConstant> splashInfos = [
  FAConstant()
    ..image = FAImage.imgGirlFirst
    ..backgroundImage = FAImage.imgBackgroundFirst
    ..firstText = FAUiS.current.bodyText
    ..secondText = FAUiS.current.crossfitText
    ..thirdText = FAUiS.current.exercises,
  FAConstant()
    ..image = FAImage.imgGirlSecond
    ..backgroundImage = FAImage.imgBackgroundSecond
    ..firstText = FAUiS.current.strongText
    ..secondText = FAUiS.current.timelessText
    ..thirdText = FAUiS.current.womanText,
  FAConstant()
    ..image = FAImage.imgGirlThird
    ..backgroundImage = FAImage.imgBackgroundThird
    ..firstText = FAUiS.current.healthyText
    ..secondText = FAUiS.current.sportswomanText
    ..thirdText = FAUiS.current.standingText,
];
