import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({
    super.key,
  });

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
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
                    'assets/images/img_training.png',
                    width: context.width,
                    height: context.sizeHeight(429),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: context.padding(top: 45),
                    child: Column(
                      children: [],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 24,
                right: 24,
                child: FATopNavigation(
                  onLeadingPress: () => context.pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
