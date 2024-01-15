import 'package:fitness_app/data/models/user_data.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
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
    final s = FAUiS.of(context);

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20,
            top: MediaQuery.paddingOf(context).top + 5,
          ),
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
                      backgroundImage: AssetImage(widget.user.image),
                    ),
                    const SizedBox(height: 7),
                    FAText.headlineLarge(
                      context,
                      text: '${widget.user.name} !',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      s.basicMember,
                      style: context.textTheme.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child:
                      Text(s.dashboard, style: context.textTheme.labelMedium),
                ),
                Divider(
                  thickness: 1,
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.15),
                  indent: 0,
                  height: 32,
                ),
                Column(
                  children: [
                    FASideMenu(icon: FAIcons.iconPlan, title: s.plan),
                    FASideMenu(icon: FAIcons.iconTrain, title: s.training),
                    FASideMenu(icon: FAIcons.iconCategory, title: s.categories),
                    FASideMenu(icon: FAIcons.iconAccount, title: s.myAccount),
                    FASideMenu(icon: FAIcons.iconFavorite, title: s.myFavorite),
                    FASideMenu(icon: FAIcons.iconSetting, title: s.appSetting),
                    FASideMenu(
                      icon: FAIcons.iconContact,
                      title: s.contactSupport,
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
                  Text(s.signOut, style: context.textTheme.titleMedium),
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
          height: 38,
        ),
      ],
    );
  }
}
