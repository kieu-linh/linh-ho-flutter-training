//import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:fitness_ui/core/color/app_color.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Popup widget that you can use by default to show some information
class FASnackBar {
  static void showSnackBar(
    BuildContext context, {
    required String message,
    String? title,
    Color? color,
    String? iconPath,
    Color? iconColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: context.sizeHeight(90),
              decoration: BoxDecoration(
                color: color ?? context.colorScheme.onError,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  context.sizedBox(width: 48),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title ?? '', style: AppTextStyles.titleSnackBar),
                        const Spacer(),
                        Text(
                          message,
                          style: AppTextStyles.messageSnackBar,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: SvgPicture.asset(
                FAIcons.iconSplash,
                height: context.sizeHeight(48),
                width: context.sizeWidth(40),
                // ignore: deprecated_member_use
                color: iconColor ?? AppColor.iconError,
              ),
            ),
            Positioned(
              top: -13,
              left: 10,
              child: SvgPicture.asset(
                iconPath ?? FAIcons.iconError,
                height: context.sizeHeight(50),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: context.colorScheme.onTertiary,
        elevation: 0,
      ),
    );
  }

  static void success(
    BuildContext context, {
    required String message,
  }) {
    final s = FAUiS.of(context);
    showSnackBar(
      context,
      title: s.wellDone,
      message: message,
      color: AppColor.bgSnackBar,
      iconColor: AppColor.iconSuccess,
      iconPath: FAIcons.iconTickSuccess,
    );
  }

  static void error(
    BuildContext context, {
    required String message,
  }) {
    final s = FAUiS.of(context);
    showSnackBar(
      context,
      title: s.ohSnap,
      message: message,
    );
  }
}
