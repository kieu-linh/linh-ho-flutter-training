import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';

class FATopNavigation extends StatelessWidget {
  FATopNavigation({
    this.title,
    super.key,
    this.trailing = const SizedBox(width: 8),
    Widget? leading,
    this.onLeadingPress,
    this.onTrailingPress,
    this.padding,
  }) : leading = leading ?? FAIcons.back();

  final Widget? trailing;
  final Widget? leading;
  final String? title;
  final VoidCallback? onLeadingPress;
  final VoidCallback? onTrailingPress;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          context.padding(top: MediaQuery.paddingOf(context).top + 10),
      child: Row(
        children: [
          InkWell(
            onTap: onLeadingPress,
            child: Padding(
              padding: context.padding(all: 3),
              child: leading,
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
            onTap: onTrailingPress,
            child: trailing,
          ),
        ],
      ),
    );
  }
}
