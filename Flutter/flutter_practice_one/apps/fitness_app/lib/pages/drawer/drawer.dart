import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/data/models/user_data.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({
    required this.user,
    super.key,
    this.onTap,
  });
  final UserModel user;
  final VoidCallback? onTap;

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 20, top: MediaQuery.of(context).padding.top + 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: widget.onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: SvgPicture.asset(FAIcons.iconClose),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 52,
                      backgroundImage: AssetImage(widget.user.image ?? ''),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      '${widget.user.name ?? ''} !',
                      style: AppTextStyles.nameUser
                          .copyWith(color: context.colorScheme.tertiary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.l10n.basicMember,
                      style: context.textTheme.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Text(
                    context.l10n.dashboard,
                    style: context.textTheme.labelMedium,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.15),
                  indent: 0,
                  height: 32,
                ),
                Column(
                  children: [
                    FASideMenu(
                        icon: FAIcons.iconPlan, title: context.l10n.plan),
                    FASideMenu(
                      icon: FAIcons.iconTrain,
                      title: context.l10n.training,
                    ),
                    FASideMenu(
                      icon: FAIcons.iconCategory,
                      title: context.l10n.categories,
                    ),
                    FASideMenu(
                      icon: FAIcons.iconAccount,
                      title: context.l10n.myAccount,
                    ),
                    FASideMenu(
                      icon: FAIcons.iconFavorite,
                      title: context.l10n.myFavorite,
                    ),
                    FASideMenu(
                      icon: FAIcons.iconSetting,
                      title: context.l10n.appSetting,
                    ),
                    FASideMenu(
                      icon: FAIcons.iconContact,
                      title: context.l10n.contactSupport,
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () => GoRouter.of(context).go('/loginScreen'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              color: context.colorScheme.secondary,
              child: Row(
                children: [
                  SvgPicture.asset(FAIcons.iconSignOut),
                  const SizedBox(width: 22),
                  Text(
                    context.l10n.signOut,
                    style: context.textTheme.titleMedium,
                  ),
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
            Text(title ?? '', style: context.textTheme.labelMedium),
          ],
        ),
        Divider(
          thickness: 1,
          color: context.colorScheme.onSurfaceVariant.withOpacity(0.15),
          height: 38,
        ),
      ],
    );
  }
}
