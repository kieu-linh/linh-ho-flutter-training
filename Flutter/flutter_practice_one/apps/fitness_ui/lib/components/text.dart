import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';

class FAText extends StatelessWidget {
  /// Constructor for FAText widget.
  const FAText({
    required this.text,
    this.style,
    this.textAlign,
    super.key,
  });

  /// Factory constructor to create Display Large Text .
  factory FAText.displayLarge(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ?? context.textTheme.headlineLarge,
      textAlign: textAlign,
    );
  }

  /// Factory constructor to create Display Medium Text .
  factory FAText.displayMedium(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ??
          context.textTheme.titleLarge
              ?.copyWith(color: context.colorScheme.secondary),
      textAlign: textAlign,
    );
  }

  /// Factory constructor to create Body Large .
  factory FAText.displaySmall(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ?? context.textTheme.headlineSmall,
      textAlign: textAlign,
    );
  }
  factory FAText.headlineLarge(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ??
          AppTextStyles.nameUser.copyWith(color: context.colorScheme.tertiary),
      textAlign: textAlign,
    );
  }
  factory FAText.headlineMedium(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ?? context.textTheme.labelLarge,
      textAlign: textAlign,
    );
  }
  factory FAText.headlineSmall(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ?? context.textTheme.titleSmall,
      textAlign: textAlign,
    );
  }
  factory FAText.bodyLarge(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ?? context.textTheme.bodyLarge,
      textAlign: textAlign,
    );
  }

  /// Factory constructor to create Body Medium Text
  factory FAText.bodyMedium(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ??
          context.textTheme.titleLarge
              ?.copyWith(color: context.colorScheme.tertiary),
      textAlign: textAlign,
    );
  }
  factory FAText.bodySmall(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ?? context.textTheme.labelSmall?.copyWith(fontSize: 12),
      textAlign: textAlign,
    );
  }

  /// Factory constructor to create Medium Text .
  factory FAText.titleLarge(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ??
          context.textTheme.titleSmall?.copyWith(
            color: context.colorScheme.onSurface,
          ),
      textAlign: textAlign,
    );
  }

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
