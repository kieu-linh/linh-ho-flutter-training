import 'package:api_client/api_client.dart';
import 'package:fitness_app/features/home/bloc/home_bloc.dart';
import 'package:fitness_app/features/home/bloc/home_event.dart';
import 'package:fitness_app/features/home/bloc/home_state.dart';
import 'package:fitness_app/features/home/repositories/home_repositories.dart';
import 'package:fitness_app/seeds/user.dart';
import 'package:fitness_app/features/drawer/layout/drawer.dart';
import 'package:fitness_app/features/home/presentation/home.dart';
import 'package:fitness_ui/components/zoom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FAZoomDrawer(
        controller: zoomDrawerController,
        menu: BlocProvider(
          create: (context) =>
              HomeBloc(HomeRepository(context.read<ApiClient>()))
                ..add(HomeFetchUserData()),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => DrawerPage(
              onTap: () => zoomDrawerController.close?.call(),
              user: UserSeeds.user1,
              name: '${state.user?.name} !',
            ),
          ),
        ),
        child: const HomePage(),
      ),
    );
  }
}

ZoomDrawerController zoomDrawerController = ZoomDrawerController();
