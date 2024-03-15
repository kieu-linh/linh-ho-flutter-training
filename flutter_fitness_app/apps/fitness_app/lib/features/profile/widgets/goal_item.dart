import 'package:fitness_app/features/home/model/category.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';

class FAGoalItem extends StatelessWidget {
  const FAGoalItem({
    required this.goals,
    super.key,
  });

  final List<Category> goals;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.padding(left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.titleGoal,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        context.sizedBox(height: 23),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: context.padding(horizontal: 20),
            child: Row(
              children: List.generate(goals.length, (index) {
                return Padding(
                  padding: context.padding(right: 19),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          goals[index].imagePath ?? '',
                        ),
                      ),
                      const SizedBox(height: 10),
                      FAText.bodyLarge(
                        context,
                        text: goals[index].name ?? '',
                        style:
                            context.textTheme.bodyLarge?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
