import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/constant/icons.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_svg/svg.dart';

class FABottomNavBar extends StatelessWidget {
  const FABottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: context.colorScheme.onSecondary,
      child: SizedBox(
        height: 76,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                text: context.l10n.home,
                image: FAIcons.icHome,
                selected: true,
                onPressed: () {},
              ),
              IconBottomBar(
                text: context.l10n.mealPlans,
                image: FAIcons.icMeal,
                selected: false,
                onPressed: () {},
              ),
              IconBottomBar(
                text: context.l10n.exercise,
                image: FAIcons.iconGainMuscle,
                selected: false,
                onPressed: () {},
              ),
              IconBottomBar(
                text: context.l10n.profile,
                image: FAIcons.icProfile,
                selected: false,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    required this.text,
    required this.selected,
    required this.onPressed,
    required this.image,
    super.key,
  });
  final String text;
  final bool selected;
  // ignore: inference_failure_on_function_return_type
  final Function() onPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: SvgPicture.asset(image),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: context.textTheme.headlineMedium?.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
