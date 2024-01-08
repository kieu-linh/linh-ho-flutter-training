import 'dart:async';

import 'package:fitness_ui/core/color/app_color.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/pages/drawer/drawer_main.dart';
import 'package:flutter_svg/svg.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

class FABottomNavigationBar extends StatefulWidget {
  const FABottomNavigationBar({
    this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell? navigationShell;

  @override
  State<FABottomNavigationBar> createState() => _FABottomNavigationBarState();
}

class _FABottomNavigationBarState extends State<FABottomNavigationBar> {
  int currentIndex = 0;
  final titles = [
    FAUiS.current.home,
    FAUiS.current.mealPlans,
    FAUiS.current.exercise,
    FAUiS.current.profile,
  ];

  void _goToBrach(int? index) {
    widget.navigationShell?.goBranch(
      index ?? 0,
      initialLocation: index == widget.navigationShell?.currentIndex,
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
