import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/constant/icons.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_practice_one/data/models/user_model.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_svg/svg.dart';

class FAAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FAAppBar({
    required this.user,
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder({Color? color}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 2,
          color: color ?? Colors.grey.withOpacity(0.25),
        ),
      );
    }

    String getDay() {
      final time = DateTime.now();
      if (time.hour >= 6 && time.hour <= 11) {
        return context.l10n.morning;
      } else if (time.hour >= 11 && time.hour <= 17) {
        return context.l10n.afternoon;
      } else {
        return context.l10n.evening;
      }
    }

    return Stack(
      children: [
        Container(
          height: 237,
          decoration: const BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.only(
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
            backgroundColor: Colors.white.withOpacity(0.1),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 46,
          left: 18,
          right: 18,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(FAIcons.iconMenu),
                  const SizedBox(width: 5),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(user.image ?? ''),
                  ),
                  const Spacer(),
                  SvgPicture.asset(FAIcons.iconNotification),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                getDay(),
                style: AppTextStyles.textSmall.copyWith(
                  color: AppColor.secondary,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '${user.name ?? ''} !',
                style: AppTextStyles.nameUser,
              ),
              const Spacer(),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: outlineInputBorder(),
                  enabledBorder: outlineInputBorder(),
                  prefixIcon: SvgPicture.asset(FAIcons.iconSearch),
                  hintText: context.l10n.search,
                  prefixIconConstraints:
                      const BoxConstraints(maxHeight: 24, minWidth: 50),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(237);
}
