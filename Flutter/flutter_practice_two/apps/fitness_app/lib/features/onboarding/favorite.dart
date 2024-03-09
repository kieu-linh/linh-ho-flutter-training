import 'package:fitness_app/seeds/favorite.dart';
import 'package:fitness_app/features/onboarding/layout/scaffold.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FAScaffold(
      currentStep: 1,
      title: context.l10n.yourFavoriteText,
      body: context.sizedBox(
        height: 430,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: GridView.builder(
            itemCount: FavoriteSeeds.listFavorite.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4 / 4.1,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    FavoriteSeeds.listFavorite[index].imagePath,
                    height: context.sizeHeight(100),
                  ),
                  const SizedBox(height: 11),
                  FAText.titleLarge(
                    context,
                    text: FavoriteSeeds.listFavorite[index].title,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      onNext: () => GoRouter.of(context).push('/age'),
    );
  }
}
