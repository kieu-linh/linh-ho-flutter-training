import 'package:fitness_app/seeds/user.dart';
import 'package:fitness_app/features/drawer/layout/drawer.dart';
import 'package:fitness_app/features/home/presentation/home.dart';
import 'package:fitness_ui/components/zoom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key});

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

ZoomDrawerController zoomDrawerController = ZoomDrawerController();
