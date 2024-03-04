import 'package:fitness_app/features/category/bloc/category_bloc.dart';
import 'package:fitness_app/features/category/bloc/category_event.dart';
import 'package:fitness_app/features/category/bloc/category_state.dart';
import 'package:fitness_app/features/category/repositories/category_repository.dart';
import 'package:fitness_ui/components/search_box.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return BlocProvider(
      create: (context) => CategoryBloc(
        RepositoryProvider.of<CategoryRepository>(context),
      )..add(CategoryFetchData()),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          final listCategory = state.searchKey?.isNotEmpty == true
              ? state.categories
                  ?.where(
                    (e) => (e.name ?? '')
                        .toLowerCase()
                        .contains(state.searchKey!.toLowerCase()),
                  )
                  .toList()
              : state.categories;
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 22),
                  child: FATopNavigation(
                    onLeadingPress: () =>
                        GoRouter.of(context).go('/homeScreen'),
                    title: s.categories,
                  ),
                ),
                Padding(
                  padding: context.padding(horizontal: 20),
                  child: FASearchBox(
                    onChanged: (value) {
                      context.read<CategoryBloc>().add(CategorySearch(value));
                    },
                  ),
                ),
                context.sizedBox(height: 62),
                Expanded(
                  child: GridView.builder(
                    padding: context.padding(horizontal: 24),
                    itemCount: listCategory?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 22,
                      crossAxisSpacing: 65,
                      childAspectRatio: 2 / 2.5,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 56,
                            backgroundImage:
                                AssetImage(listCategory![index].image ?? ''),
                          ),
                          const SizedBox(height: 20),
                          FAText.bodyLarge(
                            context,
                            text: listCategory[index].name ?? '',
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
