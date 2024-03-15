import 'package:fitness_app/core/extension/date.dart';
import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/search_box.dart';
import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';

class FAAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FAAppBar({
    super.key,
    this.controller,
    this.onPressed,
    this.avatar = FAImage.imgAvatarHome,
    this.name,
  });
  final TextEditingController? controller;
  final VoidCallback? onPressed;
  final String avatar;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.sizeHeight(247),
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
          top: MediaQuery.paddingOf(context).top + 5,
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
                    child: FAIcons.menu(),
                  ),
                  const SizedBox(width: 5),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(avatar),
                  ),
                  const Spacer(),
                  FAIcons.notification(),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                DateTime.now().getDaySession(),
                style: AppTextStyles.textSmall.copyWith(
                  color: context.colorScheme.secondary,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 5),
              Text(name ?? context.l10n.userName,
                  style: AppTextStyles.nameUser),
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
