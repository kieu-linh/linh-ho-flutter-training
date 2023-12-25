import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/theme/app_theme.dart';

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
