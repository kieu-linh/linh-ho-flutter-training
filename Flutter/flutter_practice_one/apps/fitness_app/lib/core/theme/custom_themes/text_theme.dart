import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';

class FATextTheme {
  FATextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: AppTextStyles.titlePrimary,
    displayMedium: AppTextStyles.titleMedium,
    displaySmall: AppTextStyles.textButton,
    headlineLarge: AppTextStyles.headlineLarge,
    headlineMedium: AppTextStyles.headlineMedium,
    headlineSmall: AppTextStyles.textBottom,
    bodyLarge: AppTextStyles.textTitle,
    bodyMedium: AppTextStyles.textButtonMedium,
    bodySmall: AppTextStyles.textSmall,
    titleLarge: AppTextStyles.textButtonSmall,
    labelLarge: AppTextStyles.labelLarge,
    labelMedium: AppTextStyles.labelMedium,
    labelSmall: AppTextStyles.textAppBar,
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: AppTextStyles.titlePrimary,
    displayMedium: AppTextStyles.titleMedium,
    displaySmall: AppTextStyles.textButton,
    headlineLarge: AppTextStyles.headlineLarge,
    headlineMedium: AppTextStyles.headlineMedium,
    headlineSmall: AppTextStyles.textBottom,
    bodyLarge: AppTextStyles.textTitle,
    bodyMedium: AppTextStyles.textButtonMedium,
    bodySmall: AppTextStyles.textSmall,
    titleLarge: AppTextStyles.textButtonSmall,
    labelLarge: AppTextStyles.labelLarge,
    labelMedium: AppTextStyles.labelMedium,
    labelSmall: AppTextStyles.textAppBar,
  );
}
