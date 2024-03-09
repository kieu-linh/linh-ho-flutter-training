import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';

class FACard extends StatelessWidget {
  const FACard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.sizeHeight(250),
          padding: context.padding(all: 30, top: 50),
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
              Image.asset(FAImage.imgGirlCard, package: 'fitness_ui'),
              Expanded(
                child: Padding(
                  padding: context.padding(top: 60),
                  child: Column(
                    children: [
                      Text(
                        context.l10n.cardTitle,
                        style: AppTextStyles.textButtonMedium
                            .copyWith(fontSize: 17),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 28,
                        decoration: BoxDecoration(
                          color: context.colorScheme.inversePrimary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: context.padding(horizontal: 16, vertical: 6),
                          child: Text(
                            context.l10n.buttonCardText,
                            style: AppTextStyles.textAppBar.copyWith(
                              fontSize: 12,
                              color: context.colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Image.asset(
                          FAImage.imgDumbbell,
                          package: 'fitness_ui',
                        ),
                      ),
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
