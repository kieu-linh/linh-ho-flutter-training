import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/search_box.dart';
import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/utils/get_string_day.dart';

class FAAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FAAppBar({
    super.key,
    this.controller,
    this.onPressed,
    this.avatar,
    this.name,
  });
  final TextEditingController? controller;
  final VoidCallback? onPressed;
  final String? avatar;
  final String? name;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Stack(
      children: [
        Container(
          height: 237,
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        Positioned(
          top: -76,
          left: -36,
          child: CircleAvatar(
            radius: 103,
            backgroundColor: context.colorScheme.secondary.withOpacity(0.1),
          ),
        ),
        Positioned(
          top: -88,
          left: -83,
          child: CircleAvatar(
            radius: 103,
            backgroundColor: context.colorScheme.secondary.withOpacity(0.1),
          ),
        ),
        Positioned(
          top: MediaQuery.paddingOf(context).top + 20,
          left: 18,
          right: 18,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: onPressed,
                    child: FAIcon.menu(),
                  ),
                  const SizedBox(width: 5),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(FAImage.imgAvatar),
                  ),
                  const Spacer(),
                  FAIcon.notification(),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                GetStringDay.getTitle(),
                style: AppTextStyles.textSmall.copyWith(
                  color: context.colorScheme.secondary,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 5),
              Text(s.userName, style: AppTextStyles.nameUser),
              const Spacer(),
              FASearchBox(controller: controller),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(237);
}
