import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FATopNavigation extends StatelessWidget {
  FATopNavigation({
    this.title,
    super.key,
    this.trailing = const SizedBox(width: 8),
    Widget? leading,
    this.onLeadingPress,
    this.onTrailingPress,
  }) : leading = leading ?? SvgPicture.asset(FAIcons.iconBack);

  final Widget? trailing;
  final Widget? leading;
  final String? title;
  final VoidCallback? onLeadingPress;
  final VoidCallback? onTrailingPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onLeadingPress,
          child: Padding(
            padding: const EdgeInsets.all(3), child: leading,
            //SvgPicture.asset(FAIcons.iconBack),
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
          onTap: onTrailingPress, child: trailing,
          //SvgPicture.asset(icon ?? ''),
        ),
      ],
    );
  }
}
