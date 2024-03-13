import 'package:api_client/api_client.dart';
import 'package:fitness_app/features/onboarding/favorite/bloc/favorite_bloc.dart';
import 'package:fitness_app/features/onboarding/favorite/bloc/favorite_event.dart';
import 'package:fitness_app/features/onboarding/favorite/bloc/favorite_state.dart';
import 'package:fitness_app/features/onboarding/favorite/repository/favorite_repository.dart';
import 'package:fitness_app/features/onboarding/layout/scaffold.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavoriteBloc(FavoriteRepository(context.read<ApiClient>()))
            ..add(FavoriteFetchData()),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return FAScaffold(
            currentStep: 1,
            title: context.l10n.yourFavoriteText,
            body: context.sizedBox(
              height: context.sizeHeight(430),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: GridView.builder(
                  itemCount: state.favorites?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4 / 4.1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => context.read<FavoriteBloc>().add(
                            FavoriteOnTap(index: index),
                          ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                state.favorites?[index].imagePath ?? '',
                                height: context.sizeHeight(100),
                              ),
                              state.index == index
                                  ? Container(
                                      width: 107,
                                      height: 107,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: context.colorScheme.onTertiary,
                                        border: Border.all(
                                          color: context.colorScheme.error,
                                          width: 2,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          const SizedBox(height: 11),
                          FAText.titleLarge(
                            context,
                            text: state.favorites?[index].name ?? '',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            onNext: () => context.go(AppRoutes.ageScreen.path),
          );
        },
      ),
    );
  }
}
