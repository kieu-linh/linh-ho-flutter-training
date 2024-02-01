import 'package:fitness_app/data/models/favorite_data.dart';
import 'package:fitness_app/pages/onboarding/layout/scaffold.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    final size = MediaQuery.sizeOf(context);
    return FAScaffold(
      currentStep: 1,
      title: s.yourFavorite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.6,
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
                    FAText.titleLarge(
                      context,
                      text: listFavorite[index].title ?? '',
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      onNext: () => GoRouter.of(context).push('/ageScreen'),
    );
  }
}
