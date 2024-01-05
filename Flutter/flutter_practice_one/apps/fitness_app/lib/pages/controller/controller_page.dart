import 'dart:async';

import 'package:fitness_ui/core/color/app_color.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/pages/drawer/drawer_main.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  int currentIndex = 0;

  void _goToBrach(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  Future<void> changePage(int index) async {
    if (zoomDrawerController.isOpen != null) {
      await zoomDrawerController.close?.call();
    }

    currentIndex = index;
    setState(() {});
    _goToBrach(currentIndex);
  }

  List<String> listIcon = [
    FAIcons.iconHome,
    FAIcons.iconMeal,
    FAIcons.iconGainMuscle,
    FAIcons.iconProfile,
  ];

  @override
  Widget build(BuildContext context) {
    final titles = [
      context.l10n.home,
      context.l10n.mealPlans,
      context.l10n.exercise,
      context.l10n.profile,
    ];
    return Scaffold(
      body:
          // ignore: sized_box_shrink_expand
          SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              color: context.colorScheme.tertiary.withOpacity(0.1),
            ),
          ],
          color: context.colorScheme.secondary,
        ),
        child: Row(
          children: List.generate(listIcon.length, (index) {
            return InkWell(
              onTap: () {
                changePage(index);
              },
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width / 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      listIcon[index],
                      // ignore: deprecated_member_use
                      color: currentIndex == index
                          ? context.colorScheme.tertiary
                          : AppColor.bottomNavigationColor,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      titles[index],
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontSize: 12,
                        color: currentIndex == index
                            ? context.colorScheme.tertiary
                            : AppColor.bottomNavigationColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
