import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FAZoomDrawer extends StatelessWidget {
  const FAZoomDrawer({
    required this.menuScreen,
    required this.screen,
    super.key,
    this.controller,
  });

  final ZoomDrawerController? controller;
  final Widget menuScreen;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      disableDragGesture: true,
      //menuScreenTapClose: true,
      mainScreenTapClose: true,
      controller: controller,
      menuScreenWidth: MediaQuery.of(context).size.width * 0.6,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      menuScreen: menuScreen,
      mainScreen: screen,
      mainScreenScale: 0.1,
      angle: 0,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.easeInOut,
    );
  }
}


