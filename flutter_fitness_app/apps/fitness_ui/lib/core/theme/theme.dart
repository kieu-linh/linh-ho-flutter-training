// ignore_for_file: deprecated_member_use

import 'package:fitness_ui/core/color/app_color.dart';
import 'package:fitness_ui/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FAppTheme {
  FAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat-Regular',
    brightness: Brightness.light,
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.secondary,
    colorScheme: AppTheme.colorSchemeLight,
    textTheme: AppTheme.textTheme,
    backgroundColor: AppColor.secondary,
    shadowColor: AppColor.tertiaryContainer.withOpacity(0.4),
    dialogBackgroundColor: AppColor.secondary,
  );

   static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat-Regular',
    brightness: Brightness.dark,
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.darkOutlineColor,
    colorScheme: AppTheme.colorSchemeDart,
    textTheme: AppTheme.textTheme,
    backgroundColor: AppColor.secondary,
    shadowColor: AppColor.tertiaryContainer.withOpacity(0.4),
    dialogBackgroundColor: AppColor.darkOutlineColor,
  );
}
