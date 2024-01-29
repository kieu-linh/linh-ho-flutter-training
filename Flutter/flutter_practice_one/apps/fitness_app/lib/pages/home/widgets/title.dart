import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';

class FATitleHome extends StatelessWidget {
  const FATitleHome({
    required this.title,
    super.key,
    this.titleSmall,
    this.onPressed,
  });

  final String title;
  final String? titleSmall;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Row(
        children: [
          Text(
            title,
            style: context.textTheme.headlineLarge?.copyWith(fontSize: 18),
          ),
          const Spacer(),
          if (titleSmall != null)
            GestureDetector(
              onTap: onPressed,
              child: Text(
                titleSmall!,
                style: context.textTheme.labelSmall?.copyWith(fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
