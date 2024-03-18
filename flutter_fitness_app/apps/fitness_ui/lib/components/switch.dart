import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';

class FASwitch extends StatelessWidget {
  const FASwitch({
    // required this.onChanged,
    // this.isDark = false,
    super.key,
  });

  // final VoidCallback onChanged;
  // final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 26,
        width: 45,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
