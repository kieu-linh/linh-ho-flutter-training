// ignore_for_file: deprecated_member_use
import 'package:api_client/api_client.dart';
import 'package:fitness_app/features/exercise_detail/widgets/container_exercise.dart';
import 'package:fitness_app/features/exercise_detail/widgets/description_exercise.dart';
import 'package:fitness_app/features/exercise_detail/widgets/exercise_info.dart';
import 'package:fitness_app/features/exercise_detail/widgets/exercise_program.dart';
import 'package:fitness_app/features/home/bloc/home_bloc.dart';
import 'package:fitness_app/features/home/bloc/home_event.dart';
import 'package:fitness_app/features/home/bloc/home_state.dart';
import 'package:fitness_app/features/home/model/exercise.dart';
import 'package:fitness_app/features/home/presentation/widgets/add_exercise.dart';
import 'package:fitness_app/features/home/repositories/home_repositories.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExerciseDetailPage extends StatefulWidget {
  const ExerciseDetailPage({
    required this.exercise,
    super.key,
  });

  final Exercise exercise;
  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    widget.exercise.backgroundImage ?? '',
                    width: context.width,
                    height: context.sizeHeight(379),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: context.padding(top: 45),
                    child: Column(
                      children: [
                        FAExerciseInfo(widget: widget),
                        FADescriptionExercise(widget: widget),
                        FAExerciseProgram(widget: widget),
                        BlocProvider(
                            create: (context) => HomeBloc(
                                  HomeRepository(context.read<ApiClient>()),
                                )..add(HomeFetchAddExerciseData()),
                            child: BlocBuilder<HomeBloc, HomeState>(
                              builder: (context, state) {
                                return FAAddExercise(
                                  addExercises: state.addExercises,
                                );
                              },
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
                          child: FAButton(
                            text: context.l10n.startNow,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 24,
                right: 24,
                child: FATopNavigation(
                  onLeadingPress: () =>
                      context.go(AppRoutes.exerciseScreen.path),
                ),
              ),
              Positioned(
                top: 370,
                left: 20,
                right: 20,
                child: FAContainerExercise(widget: widget),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
