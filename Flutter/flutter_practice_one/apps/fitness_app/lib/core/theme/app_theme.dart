import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';

class AppTheme {
  const AppTheme();

  // ignore: unused_element
  static ColorScheme get colorScheme {
    return const ColorScheme.light(
      // ignore: avoid_redundant_argument_values
      brightness: Brightness.light,
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      onSecondary: AppColor.onSecondary,
      tertiary: AppColor.tertiary,
      tertiaryContainer: AppColor.tertiaryContainer,
      onSurface: AppColor.onSurface,
      onSurfaceVariant: AppColor.onSurfaceVariant,
      error: AppColor.error,
      onError: AppColor.onError,
    );
  }

  // ignore: unused_element
  ColorScheme get _colorSchemeDark {
    return const ColorScheme.dark(
      // ignore: avoid_redundant_argument_values
      brightness: Brightness.dark,
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      onSecondary: AppColor.onSecondary,
      tertiary: AppColor.tertiary,
      tertiaryContainer: AppColor.tertiaryContainer,
      onSurface: AppColor.onSurface,
      onSurfaceVariant: AppColor.onSurfaceVariant,
      error: AppColor.error,
      onError: AppColor.onError,
    );
  }

  /// Define the text theme for the app
  // ignore: unused_field
  static final TextTheme textTheme = TextTheme(
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
    titleSmall: AppTextStyles.textStepPage,
  );
}
//buttonthem, textbutton, appbar, bottom navigation, input decoration
