// ignore_for_file: inference_failure_on_function_return_type

import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FASearchBox extends StatelessWidget {
  const FASearchBox({
    super.key,
    this.controller,
    this.onChanged,
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    OutlineInputBorder outlineInputBorder({Color? color}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 2,
          color: context.colorScheme.outline.withOpacity(0.25),
        ),
      );
    }

    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: context.colorScheme.secondary,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 13),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        prefixIcon: FAIcon.search(),
        hintText: s.search,
        prefixIconConstraints:
            const BoxConstraints(maxHeight: 24, minWidth: 50),
      ),
    );
  }
}
