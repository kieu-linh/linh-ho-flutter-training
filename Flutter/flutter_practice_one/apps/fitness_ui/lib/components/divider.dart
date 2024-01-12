import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';

class FADivider extends StatelessWidget {
  const FADivider({
    super.key,
    this.height,
    this.indent = 20,
    this.endIndent = 20,
  });

  final double? height;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: context.colorScheme.onSurfaceVariant.withOpacity(0.15),
      indent: indent,
      endIndent: endIndent,
      height: height,
    );
  }
}
