import 'package:fitness_ui/core/extension/extension.dart';
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
      style: style ?? context.textTheme.displayLarge,
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
      style: style ?? context.textTheme.displayMedium,
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
      style: style ??
          context.textTheme.displaySmall
              ?.copyWith(color: context.colorScheme.tertiary),
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
      style: style ?? context.textTheme.headlineLarge,
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
      style: style ?? context.textTheme.headlineMedium,
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
      style: style ??
          context.textTheme.headlineSmall
              ?.copyWith(color: context.colorScheme.tertiary),
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
      style: style ??
          context.textTheme.bodyLarge
              ?.copyWith(color: context.colorScheme.tertiary),
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
      style: style ?? context.textTheme.bodyMedium,
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
      style: style ?? context.textTheme.bodySmall,
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
      style: style ?? context.textTheme.titleLarge,
      textAlign: textAlign,
    );
  }
  factory FAText.labelLarge(
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
  factory FAText.labelMedium(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ?? context.textTheme.labelMedium,
      textAlign: textAlign,
    );
  }
  factory FAText.labelSmall(
    BuildContext context, {
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return FAText(
      text: text,
      style: style ?? context.textTheme.labelSmall,
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
