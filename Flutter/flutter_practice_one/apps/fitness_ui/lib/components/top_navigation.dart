import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FATopNavigation extends StatelessWidget {
  const FATopNavigation({
    required this.onPressLeft,
    this.onPressRight,
    this.title,
    super.key,
    this.icon,
  });

  final String? icon;
  final String? title;
  final VoidCallback onPressLeft;
  final VoidCallback? onPressRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onPressLeft,
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: SvgPicture.asset(
              FAIcons.iconBack,
            ),
          ),
        ),
        const Spacer(),
        Text(
          title ?? '',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.tertiaryContainer,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onPressRight,
          child: SvgPicture.asset(icon ?? ''),
        ),
      ],
    );
  }
}
