import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_practice_one/data/models/favorite_data.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/pages/age/age.dart';
import 'package:flutter_practice_one/widgets/button.dart';
import 'package:flutter_practice_one/widgets/top_control.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FATopControl(text: context.l10n.skipPage),
            const SizedBox(height: 7),
            Text(
              context.l10n.stepPage1,
              style: AppTextStyles.textStepPage,
            ),
            const SizedBox(height: 4),
            Text(
              context.l10n.yourFavorite,
              style: AppTextStyles.headlineLarge,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.65,
                    child: GridView.builder(
                      itemCount: listFavorite.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: size.width > 500 ? 3 : 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: size.width > 1100
                            ? 3 / 2
                            : size.width < 290
                                ? 2 / 3
                                : 1,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.asset(
                              listFavorite[index].image ?? '',
                              height: size.height * 0.15,
                            ),
                            const SizedBox(height: 11),
                            Text(
                              listFavorite[index].title ?? '',
                              style: AppTextStyles.textStepPage
                                  .copyWith(color: AppColor.onSurface),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: FAButton(
                onPressed: () => Navigator.push(
                  context,
                  // ignore: inference_failure_on_instance_creation
                  MaterialPageRoute(
                    builder: (context) => const AgePage(),
                  ),
                ),
                text: context.l10n.btnNextStep,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
