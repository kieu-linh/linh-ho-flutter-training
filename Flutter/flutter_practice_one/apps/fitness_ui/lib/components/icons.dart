// ignore_for_file: deprecated_member_use

import 'package:fitness_ui/core/constant/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FAIcon extends StatelessWidget {
  /// Constructor for creating an instance of FAIcon
  const FAIcon({
    required this.iconLink,
    super.key,
    this.color,
    this.width,
    this.height,
  });

  /// Factory constructor for back icon
  factory FAIcon.primary(String s, {
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: '',
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for back icon
  factory FAIcon.back({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconBack,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for eye icon
  factory FAIcon.eye({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconEye,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for facebook icon
  factory FAIcon.facebook({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconFacebook,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for google icon
  factory FAIcon.google({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconGoogle,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for tick icon
  factory FAIcon.tick({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconTick,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for eyeOpen icon
  factory FAIcon.eyeOpen({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconEyeOpen,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for weightLoss icon
  factory FAIcon.weightLoss({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconWeightLoss,
      color: color,
      height: height,
      width: width,
    );
  }

  /// Factory constructor for gainMuscle icon
  factory FAIcon.gainMuscle({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconGainMuscle,
      color: color,
      height: height,
      width: width,
    );
  }
  factory FAIcon.fitness({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconFitness,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.menu({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconMenu,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.notification({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconNotification,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.search({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconSearch,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.heart({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconHeart,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.clock({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconClock,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.calories({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconCalories,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.plan({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconPlan,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.train({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconTrain,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.category({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconCategory,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.account({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconAccount,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.favorite({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconFavorite,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.setting({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconSetting,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.contact({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconContact,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.signOut({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconSignOut,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.close({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconClose,
      color: color,
      height: height,
      width: width,
    );
  }

  factory FAIcon.edit({
    Color? color,
    double? width,
    double? height,
  }) {
    return FAIcon(
      iconLink: FAIcons.iconEdit,
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
    );
  }
}
