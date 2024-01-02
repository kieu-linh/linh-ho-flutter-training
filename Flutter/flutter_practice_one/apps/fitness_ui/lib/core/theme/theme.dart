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
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat-Regular',
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.tertiary,
    colorScheme: AppTheme.colorSchemeDark,
    textTheme: AppTheme.textTheme,
  );
}
