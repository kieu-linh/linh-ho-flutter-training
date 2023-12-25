import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';

class AppTheme {
  const AppTheme();

  static ColorScheme get colorSchemeLight {
    return const ColorScheme.light(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      onSecondary: AppColor.onSecondary,
      tertiary: AppColor.tertiary,
      tertiaryContainer: AppColor.tertiaryContainer,
      onTertiary: AppColor.transparent,
      surface: AppColor.onSurface,
      onSurface: AppColor.onSurfaceVariant,
      onSurfaceVariant: AppColor.surfaceContainer,
      outline: AppColor.outlineColor,
      outlineVariant: AppColor.outlineButton,
      error: AppColor.error,
      onError: AppColor.onError,
      inverseSurface: AppColor.iconHeart,
      onInverseSurface: AppColor.containerThird,
      inversePrimary: AppColor.containerSecond,
      surfaceTint: AppColor.containerFirst,
      background: AppColor.buttonFaceColor,
      onBackground: AppColor.iconColor,
    );
  }

  static ColorScheme get colorSchemeDark {
    return const ColorScheme.dark(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      onSecondary: AppColor.onSecondary,
      tertiary: AppColor.tertiary,
      tertiaryContainer: AppColor.tertiaryContainer,
      onTertiary: AppColor.transparent,
      surface: AppColor.onSurface,
      onSurface: AppColor.onSurfaceVariant,
      onSurfaceVariant: AppColor.surfaceContainer,
      outline: AppColor.outlineColor,
      outlineVariant: AppColor.outlineButton,
      error: AppColor.error,
      onError: AppColor.onError,
      inverseSurface: AppColor.iconHeart,
      onInverseSurface: AppColor.containerThird,
      inversePrimary: AppColor.containerSecond,
      surfaceTint: AppColor.containerFirst,
      background: AppColor.buttonFaceColor,
      onBackground: AppColor.iconColor,
    );
  }

  /// Define the text theme for the app
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
      titleMedium: AppTextStyles.textStepPage);

}


//buttonthem, textbutton, appbar, bottom navigation, input decoration
