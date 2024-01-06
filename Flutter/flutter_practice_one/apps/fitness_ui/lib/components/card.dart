import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';

class FACard extends StatelessWidget {
  const FACard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          padding: const EdgeInsets.all(30).copyWith(top: 50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.surfaceTint,
                  context.colorScheme.onTertiaryContainer,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 15,
          bottom: 0,
          right: 10,
          child: Row(
            children: [
              Image.asset(FAImage.imgGirlCard),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      Text(
                        context.l10n.titleCard,
                        style: AppTextStyles.textButtonMedium
                            .copyWith(fontSize: 19),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 28,
                        decoration: BoxDecoration(
                          color: context.colorScheme.inversePrimary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          child: Text(
                            context.l10n.textButtonCard,
                            style: AppTextStyles.textAppBar.copyWith(
                              fontSize: 12,
                              color: context.colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Image.asset(FAImage.imgDumbbell),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
