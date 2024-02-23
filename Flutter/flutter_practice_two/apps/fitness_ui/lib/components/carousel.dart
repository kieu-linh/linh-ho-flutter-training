import 'package:fitness_app/data/models/welcome_data.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FACarousel extends StatelessWidget {
  const FACarousel({
    this.onSkip,
    this.onNext,
    this.pageIndex = 0,
    this.pageController,
    super.key,
  });

  final int? pageIndex;
  final PageController? pageController;
  final VoidCallback? onSkip;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Row(
      children: [
        GestureDetector(
          onTap: onSkip,
          child: FAText.displaySmall(
            context,
            text: s.skipPage.toUpperCase(),
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
          onTap: onNext,
          child: FAText.displaySmall(
            context,
            text: s.nextPage,
          ),
        ),
      ],
    );
  }
}
