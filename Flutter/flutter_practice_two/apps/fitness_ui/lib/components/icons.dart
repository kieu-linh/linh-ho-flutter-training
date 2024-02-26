// ignore_for_file: deprecated_member_use

import 'package:fitness_ui/core/constant/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FAIcons extends StatelessWidget {
  /// Constructor for creating an instance of FAIcon
  const FAIcons({
    required this.iconLink,
    super.key,
    this.color,
    this.width,
    this.height,
  });

  /// Factory constructor for back icon
  factory FAIcons.primary({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: '',
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for back icon
  factory FAIcons.back({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconBack,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for eye icon
  factory FAIcons.eye({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconEye,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for facebook icon
  factory FAIcons.facebook({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconFacebook,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for google icon
  factory FAIcons.google({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconGoogle,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for tick icon
  factory FAIcons.tick({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconTick,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for eyeOpen icon
  factory FAIcons.eyeOpen({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconEyeOpen,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for weightLoss icon
  factory FAIcons.weightLoss({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconWeightLoss,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for gainMuscle icon
  factory FAIcons.gainMuscle({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconGainMuscle,
      color: color,
      height: height,
      width: width,
    );
  }
  factory FAIcons.fitness({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconFitness,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.menu({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconMenu,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.notification({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconNotification,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.search({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconSearch,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.heart({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconHeart,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.clock({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconClock,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.calories({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconCalories,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.plan({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconPlan,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.train({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconTrain,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.category({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconCategory,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.account({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconAccount,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.favorite({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconFavorite,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.setting({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconSetting,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.contact({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconContact,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.signOut({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconSignOut,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.close({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconClose,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.edit({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconEdit,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.splash({
    Color? color,
    double width = 48,
    double height = 50,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconSplash,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcons.home({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcons(
      iconLink: FAIcon.iconHome,
      color: color,
      height: height,
      width: width,
    );
  }

  /// link to the icon
  final String iconLink;

  /// Color for the icon
  final Color? color;

  /// Size of the icon

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconLink,
      width: width,
      height: height,
      color: color,
      package: 'fitness_ui',
    );
  }
}
