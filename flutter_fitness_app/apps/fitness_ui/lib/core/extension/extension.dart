
import 'package:fitness_ui/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  ThemeData get themeData => Theme.of(this);
  ColorScheme get colorScheme => themeData.colorScheme;
  TextTheme get textTheme => themeData.textTheme;
  FAUiS get l10n => FAUiS.of(this);
}
