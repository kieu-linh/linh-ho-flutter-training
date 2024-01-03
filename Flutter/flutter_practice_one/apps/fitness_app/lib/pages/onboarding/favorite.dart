import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/top_control.dart';
import 'package:fitness_ui/components/top_onboarding.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/data/models/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FATopControl(
              onPressed: () {},
              text: context.l10n.skipPage,
            ),
            const SizedBox(height: 9),
            TopOnBoarding(
              currentStep: 1,
              title: context.l10n.yourFavorite,
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
                              style: context.textTheme.titleSmall?.copyWith(
                                color: context.colorScheme.onSurface,
                              ),
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
                onPressed: () => GoRouter.of(context).push('/ageScreen'),
                text: context.l10n.btnNextStep,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
