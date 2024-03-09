import 'package:fitness_app/core/storage/shared_prefs.dart';
import 'package:fitness_app/models/user_data.dart';
import 'package:fitness_ui/components/dialog.dart';
import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({
    required this.user,
    this.onTap,
    this.name,
    super.key,
  });
  final User user;
  final VoidCallback? onTap;
  final String? name;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Padding(
          padding: context.padding(
            left: 20,
            top: MediaQuery.paddingOf(context).top + 5,
          ),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: onTap,
                    child: Padding(
                      padding: context.padding(all: 3),
                      child: FAIcons.close(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 52,
                        backgroundImage: AssetImage(user.image),
                      ),
                      const SizedBox(height: 7),
                      FAText.headlineLarge(
                        context,
                        text: name ?? '${user.name} !',
                      ),
                      const SizedBox(height: 8),
                      Text(context.l10n.basicMemberText,
                          style: context.textTheme.titleSmall),
                    ],
                  ),
                  context.sizedBox(height: 40),
                  Padding(
                    padding: context.padding(left: 26),
                    child:
                        Text(context.l10n.dashboard, style: context.textTheme.labelMedium),
                  ),
                  Divider(
                    thickness: 1,
                    color:
                        context.colorScheme.onSurfaceVariant.withOpacity(0.15),
                    indent: 0,
                    height: context.sizeHeight(32),
                  ),
                  Column(
                    children: [
                      FASideMenu(icon: FAIcon.iconPlan, title: context.l10n.plan),
                      FASideMenu(icon: FAIcon.iconTrain, title: context.l10n.training),
                      GestureDetector(
                        onTap: () => GoRouter.of(context).goNamed('category'),
                        child: FASideMenu(
                            icon: FAIcon.iconCategory, title: context.l10n.categories),
                      ),
                      GestureDetector(
                          onTap: () => GoRouter.of(context).go('/profile'),
                          child: FASideMenu(
                              icon: FAIcon.iconAccount, title: context.l10n.myAccount)),
                      FASideMenu(
                          icon: FAIcon.iconFavorite, title: context.l10n.myFavorite),
                      FASideMenu(icon: FAIcon.iconSetting, title: context.l10n.appSetting),
                      FASideMenu(
                        icon: FAIcon.iconContact,
                        title: context.l10n.contactSupport,
                      ),
                      context.sizedBox(height: 60),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              FADialog.question(
                context,
                title: 'Do you want logout?',
                action: () {
                  context.read<SharedPrefs>().deleteAccount();
                  GoRouter.of(context).go('/login');
                },
              );
            },
            child: Container(
              padding: context.padding(horizontal: 20, vertical: 20),
              color: context.colorScheme.secondary,
              child: Row(
                children: [
                  FAIcons.signOut(),
                  context.sizedBox(width: 22),
                  Text(context.l10n.signOut, style: context.textTheme.titleMedium),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FASideMenu extends StatelessWidget {
  const FASideMenu({
    super.key,
    this.icon,
    this.title,
  });

  final String? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(icon ?? ''),
            const SizedBox(width: 8),
            FAText.titleLarge(context, text: title ?? ''),
          ],
        ),
        Divider(
          thickness: 1,
          color: context.colorScheme.onSurfaceVariant.withOpacity(0.15),
          height: context.sizeHeight(38),
        ),
      ],
    );
  }
}
