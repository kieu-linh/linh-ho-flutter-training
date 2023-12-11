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
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'BebasNeue',
  );

  static TextStyle titlePrimaryColor = primaryTextStyle(
    fontSize: 48,
    color: AppColor.primary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'BebasNeue',
  );
  
  static TextStyle titleMedium = primaryTextStyle(
    fontSize: 16,
    color: AppColor.tertiary,
    fontWeight: AppFontWeight.regular,
    fontFamily: 'DMSans-Regular',
  );

}
