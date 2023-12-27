import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/constant/icons.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/pages/home/home.dart';
import 'package:flutter_svg/svg.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  int currentIndex = 0;

  List<String> listIcon = [
    FAIcons.icHome,
    FAIcons.icMeal,
    FAIcons.iconGainMuscle,
    FAIcons.icProfile,
  ];

  List<Widget> pages = [
    const HomePage(),
    Container(color: Colors.pink),
    Container(color: Colors.red),
    Container(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    final titles = [
      context.l10n.home,
      context.l10n.mealPlans,
      context.l10n.exercise,
      context.l10n.profile,
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              color: context.colorScheme.tertiary.withOpacity(0.1),
            ),
          ],
          color: context.colorScheme.secondary,
        ),
        child: Row(
          children: List.generate(listIcon.length, (index) {
            return InkWell(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      listIcon[index],
                      // ignore: deprecated_member_use
                      color: currentIndex == index
                          ? context.colorScheme.tertiary
                          : Color(0xFF9CA3A7),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      titles[index],
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontSize: 12,
                        color: currentIndex == index
                            ? context.colorScheme.tertiary
                            : Color(0xFF9CA3A7),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
