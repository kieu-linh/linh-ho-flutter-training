import 'dart:async';
import 'package:fitness_app/pages/drawer/drawer_main.dart';
import 'package:fitness_ui/core/color/app_color.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active.
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
    FAIcon.iconHome,
    FAIcon.iconMeal,
    FAIcon.iconGainMuscle,
    FAIcon.iconProfile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changePage,
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontFamily: 'Montserrat-Medium'),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Montserrat-Medium'),
        selectedItemColor: context.colorScheme.tertiary,
        unselectedItemColor: AppColor.bottomNavigationColor,
        items: List.generate(listIcon.length, (index) {
          return BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 10),
              child: SvgPicture.asset(
                listIcon[index],
                // ignore: deprecated_member_use
                color: currentIndex == index
                    ? context.colorScheme.tertiary
                    : AppColor.bottomNavigationColor,
                package: 'fitness_ui',
              ),
            ),
            label: titles[index],
            backgroundColor: context.colorScheme.secondary,
          );
        }),
      ),
    );
  }
}
