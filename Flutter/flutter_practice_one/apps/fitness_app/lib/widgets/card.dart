import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
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
              gradient: const LinearGradient(
                colors: [
                  Color(0XFFF6A010),
                  Color(0xffd38002),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 15,
          bottom: 0,
          child: Row(
            children: [
              Image.asset('assets/images/img_girl_card.png'),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Text(
                      context.l10n.titleCard,
                      style:
                          AppTextStyles.textButtonMedium.copyWith(fontSize: 19),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColor.containerSecond,
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
                    Image.asset('assets/images/img_dumbbell.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
