import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:fitness_ui/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/data/models/welcome_data.dart';

class FACarousel extends StatelessWidget {
  const FACarousel({
    required this.pageIndex,
    required this.pageController,
    required this.onPressedSkip,
    required this.onPressedNext,
    super.key,
  });

  final int pageIndex;
  final PageController pageController;
  final VoidCallback onPressedSkip;
  final VoidCallback onPressedNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressedSkip,
          child: Text(
            context.l10n.skipPage,
            style: AppTextStyles.textBottom,
          ),
        ),
        const Spacer(),
        ...List.generate(listWelcomes.length, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            //if _pageIndex == index, width = 15, else width = 8
            width: pageIndex == index ? 15 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              //if _pageIndex == index, color = primary
              //else color = tertiary
              color: pageIndex == index
                  ? context.colorScheme.primary
                  : context.colorScheme.tertiary,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }),
        const Spacer(),
        GestureDetector(
          onTap: onPressedNext,
          child: Text(
            context.l10n.nextPage,
            style: AppTextStyles.textBottom,
          ),
        ),
      ],
    );
  }
}
