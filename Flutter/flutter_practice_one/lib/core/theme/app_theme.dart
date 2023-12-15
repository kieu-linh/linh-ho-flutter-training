import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';

class AppTheme {
  const AppTheme();

  ColorScheme get _colorScheme {
    return const ColorScheme.light(
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

  ColorScheme get _colorSchemeDark {
    return const ColorScheme.dark(
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
  static final TextTheme _textTheme = TextTheme(
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
