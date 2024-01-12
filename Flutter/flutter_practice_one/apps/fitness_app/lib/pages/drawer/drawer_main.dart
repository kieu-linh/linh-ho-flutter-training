import 'package:fitness_ui/components/zoom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/data/models/user_data.dart';
import 'package:flutter_practice_one/pages/drawer/drawer.dart';
import 'package:flutter_practice_one/pages/home/home.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerMain extends StatefulWidget {
  const DrawerMain({super.key});

  @override
  State<DrawerMain> createState() => _DrawerMainState();
}

ZoomDrawerController zoomDrawerController = ZoomDrawerController();

class _DrawerMainState extends State<DrawerMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FAZoomDrawer(
        controller: zoomDrawerController,
        menu: DrawerPage(
          onTap: () => zoomDrawerController.close?.call(),
          user: user1,
        ),
        child: const HomePage(),
      ),
    );
  }
}
