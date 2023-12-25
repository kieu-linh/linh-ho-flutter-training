import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/typography/font_weight.dart';

//Create a class for TextStyle generator function with common properties
class AppTextStyles {
  static TextStyle primaryTextStyle({
    required double fontSize,
    required Color color,
    required FontWeight fontWeight,
    required String fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  static TextStyle titlePrimary = primaryTextStyle(
    fontSize: 48,
    color: AppColor.primary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Bebas-Regular',
  );

  static TextStyle titleMedium = primaryTextStyle(
    fontSize: 16,
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textButton = primaryTextStyle(
    fontSize: 20,
    color: AppColor.secondary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Bebas-Regular',
  );

  static TextStyle textBottom = primaryTextStyle(
    fontSize: 18,
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle headlineLarge = primaryTextStyle(
    fontSize: 30,
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Bebas-Regular',
  );

  static TextStyle headlineMedium = primaryTextStyle(
    fontSize: 15,
    color: AppColor.onSurfaceVariant,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle labelLarge = primaryTextStyle(
    fontSize: 16,
    color: AppColor.onSurfaceVariant,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle labelMedium = primaryTextStyle(
    fontSize: 14,
    color: AppColor.onSurface,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textTitle = primaryTextStyle(
    fontSize: 14,
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.semiBold,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textButtonMedium = primaryTextStyle(
    fontSize: 22,
    color: AppColor.secondary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Bebas-Regular',
  );

  static TextStyle textSmall = primaryTextStyle(
    fontSize: 12,
    color: AppColor.onSurface,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textButtonSmall = primaryTextStyle(
    fontSize: 14,
    color: AppColor.onSurface,
    fontWeight: AppFontWeight.semiBold,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textAppBar = primaryTextStyle(
    fontSize: 14,
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.bold,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textStepPage = primaryTextStyle(
    fontSize: 14,
    color: AppColor.tertiaryContainer,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textButtonGoal = primaryTextStyle(
    fontSize: 17,
    color: AppColor.onSurface,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );
}
