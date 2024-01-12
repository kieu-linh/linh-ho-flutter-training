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
      padding: const EdgeInsets.only(left: 20, bottom: 16, right: 20),
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
