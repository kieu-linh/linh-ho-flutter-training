import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FAZoomDrawer extends StatelessWidget {
  const FAZoomDrawer({
    this.menu = const SizedBox(),
    this.child = const SizedBox(),
    super.key,
    this.controller,
  });

  final ZoomDrawerController? controller;
  final Widget menu;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      disableDragGesture: true,
      mainScreenTapClose: true,
      controller: controller ?? ZoomDrawerController(),
      menuScreenWidth: MediaQuery.sizeOf(context).width * 0.6,
      slideWidth: MediaQuery.sizeOf(context).width * 0.65,
      menuScreen: menu,
      mainScreen: child,
      mainScreenScale: 0.1,
      angle: 0,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.easeInOut,
    );
  }
}
