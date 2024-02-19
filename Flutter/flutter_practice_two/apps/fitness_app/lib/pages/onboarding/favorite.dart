import 'package:fitness_app/data/models/favorite_data.dart';
import 'package:fitness_app/pages/onboarding/layout/scaffold.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return FAScaffold(
      currentStep: 1,
      title: s.yourFavorite,
      body: context.sizedBox(
        height: 430,
        child: GridView.builder(
          itemCount: listFavorite.length,
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
                  listFavorite[index].image ?? '',
                  height: 100,
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
      onNext: () => GoRouter.of(context).push('/ageScreen'),
    );
  }
}
