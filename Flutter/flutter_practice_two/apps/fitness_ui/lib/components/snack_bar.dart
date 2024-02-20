//import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
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
              height: 90,
              decoration: BoxDecoration(
                color: color ?? const Color(0xFFC72C41),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 48),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
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
                'assets/icons/ic_splash.svg',
                height: 48,
                width: 40,
                // ignore: deprecated_member_use
                color: iconColor ?? const Color(0xFF801336),
              ),
            ),
            Positioned(
              top: -13,
              left: 10,
              child: SvgPicture.asset(
                iconPath ?? 'assets/icons/ic_error.svg',
                height: 50,
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  static void success(
    BuildContext context, {
    required String message,
  }) {
    showSnackBar(
      context,
      title: 'Well Done!',
      message: message,
      color: const Color(0XFF0C7040),
      iconColor: const Color(0XFF004E32),
      iconPath: 'assets/icons/ic_tick_success.svg',
    );
  }

  static void error(
    BuildContext context, {
    required String message,
  }) {
    showSnackBar(
      context,
      title: 'Oh snap!',
      message: message,
      //iconPath: Assets.icons.icError,
    );
  }
}
