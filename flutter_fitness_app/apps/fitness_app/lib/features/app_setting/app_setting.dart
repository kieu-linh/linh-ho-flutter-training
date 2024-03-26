// ignore_for_file: deprecated_member_use

import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/divider.dart';
import 'package:fitness_ui/components/switch.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppSettingPage extends StatefulWidget {
  const AppSettingPage({super.key});

  @override
  State<AppSettingPage> createState() => _AppSettingPageState();
}

class _AppSettingPageState extends State<AppSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            FATopNavigation(
              title: context.l10n.setting,
              onLeadingPress: () => context.go(AppRoutes.homeScreen.path),
            ),
            SizedBox(height: 30),
            ItemRow(
              iconPath: FAIcon.iconNotification,
              text: context.l10n.reminder,
            ),
            GestureDetector(
              onTap: () => context.go(AppRoutes.changePassScreen.path),
              child: ItemRow(
                iconPath: FAIcon.iconLock,
                text: context.l10n.changePass,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      FAIcon.iconHealth,
                      color: context.colorScheme.tertiary,
                    ),
                    SizedBox(width: 10),
                    Text(context.l10n.apple,
                        style: context.textTheme.labelMedium),
                    Spacer(),
                    FASwitch(),
                  ],
                ),
                FADivider(
                  height: context.sizeHeight(40),
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      FAIcon.iconDark,
                      color: context.colorScheme.tertiary,
                    ),
                    SizedBox(width: 10),
                    Text(context.l10n.darkMode,
                        style: context.textTheme.labelMedium),
                    Spacer(),
                    FASwitch(),
                  ],
                ),
                FADivider(
                  height: context.sizeHeight(40),
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      FAIcon.iconLanguage,
                      color: context.colorScheme.tertiary,
                    ),
                    SizedBox(width: 10),
                    Text(context.l10n.language,
                        style: context.textTheme.labelMedium),
                    Spacer(),
                    Text(
                      context.l10n.english,
                      style:
                          context.textTheme.bodySmall?.copyWith(fontSize: 10),
                    ),
                  ],
                ),
                FADivider(
                  height: context.sizeHeight(40),
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: context.padding(bottom: 30),
              child: FAButton(
                text: context.l10n.upgrade,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  const ItemRow({
    this.iconPath,
    this.text,
    super.key,
  });

  final String? iconPath;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              iconPath ?? '',
              color: context.colorScheme.tertiary,
            ),
            SizedBox(width: 10),
            Text(text ?? '', style: context.textTheme.labelMedium),
          ],
        ),
        FADivider(
          height: context.sizeHeight(40),
          indent: 0,
          endIndent: 0,
        ),
      ],
    );
  }
}
