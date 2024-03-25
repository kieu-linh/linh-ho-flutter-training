import 'package:fitness_ui/core/color/app_color.dart';
import 'package:fitness_ui/core/typography/font_weight.dart';
import 'package:flutter/material.dart';

//Create a class for TextStyle generator function with common properties
class AppTextStyles {
  AppTextStyles._();

  static const TextStyle titlePrimary = TextStyle(
    fontSize: 48,
    color: AppColor.primary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Bebas-Regular',
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 17,
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textButton = const TextStyle(
    fontSize: 20,
    color: AppColor.secondary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Bebas-Regular',
  );

  static TextStyle textBottom = const TextStyle(
    fontSize: 18,
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle headlineLarge = const TextStyle(
    fontSize: 30,
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Bebas-Regular',
  );

  static TextStyle headlineMedium = const TextStyle(
    fontSize: 15,
    color: AppColor.onSurfaceVariant,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle labelLarge = const TextStyle(
    fontSize: 16,
    color: AppColor.onSurfaceVariant,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle labelMedium = const TextStyle(
    fontSize: 14,
    color: AppColor.onSurface,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textTitle = const TextStyle(
    fontSize: 14,
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.semiBold,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textButtonMedium = const TextStyle(
    fontSize: 22,
    color: AppColor.secondary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Bebas-Regular',
  );

  static TextStyle textSmall = const TextStyle(
    fontSize: 12,
    color: AppColor.onSurface,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textButtonSmall = const TextStyle(
    fontSize: 14,
    color: AppColor.onSurface,
    fontWeight: AppFontWeight.semiBold,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textAppBar = const TextStyle(
    fontSize: 14,
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.bold,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textStepPage = const TextStyle(
    fontSize: 14,
    color: AppColor.tertiaryContainer,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle textButtonGoal = const TextStyle(
    fontSize: 17,
    color: AppColor.onSurface,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );
  static TextStyle textStart = const TextStyle(
    fontSize: 14,
    color: AppColor.onSurfaceVariant,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'Montserrat-Medium',
  );
  static TextStyle nameUser = const TextStyle(
    fontSize: 20,
    color: AppColor.secondary,
    fontWeight: AppFontWeight.bold,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle titleSnackBar = const TextStyle(
    fontSize: 18,
    color: AppColor.secondary,
    fontWeight: AppFontWeight.semiBold,
    fontFamily: 'Montserrat-Medium',
  );

  static TextStyle messageSnackBar = const TextStyle(
    fontSize: 12,
    color: AppColor.secondary,
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Montserrat-Medium',
  );
}
