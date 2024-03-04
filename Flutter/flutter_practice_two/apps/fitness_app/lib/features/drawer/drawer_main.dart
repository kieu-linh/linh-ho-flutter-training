import 'package:fitness_app/data/seeds/user.dart';
import 'package:fitness_app/features/drawer/drawer.dart';
import 'package:fitness_app/features/home/presentation/home.dart';
import 'package:fitness_ui/components/zoom_drawer.dart';
import 'package:flutter/material.dart';
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
          user: UserSeeds.user1,
        ),
        child: const HomePage(),
      ),
    );
  }
}
