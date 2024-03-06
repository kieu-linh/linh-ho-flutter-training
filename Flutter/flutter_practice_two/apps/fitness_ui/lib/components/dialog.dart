// ignore_for_file: inference_failure_on_function_invocation

import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FADialog {
  FADialog._();

  static void question(
    BuildContext context, {
    required String title,
    VoidCallback? action,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.colorScheme.secondary,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FAText.bodyMedium(context, text: FAUiS.current.logOutTitle),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FAButton.text(
                  height: context.sizeHeight(40),
                  onPressed: () => Navigator.pop(context),
                  text: FAUiS.current.cancel,
                  color: context.colorScheme.onSecondaryContainer,
                  textColor: context.colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 40),
                FAButton.text(
                  height: context.sizeHeight(40),
                  onPressed: () {
                    action?.call();
                    Navigator.pop(context);
                  },
                  text: FAUiS.current.logOut,
                  color: context.colorScheme.primaryContainer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
