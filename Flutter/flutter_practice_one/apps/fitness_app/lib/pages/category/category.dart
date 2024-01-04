import 'package:fitness_ui/components/search_box.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/data/models/category_data.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(
              top: MediaQuery.paddingOf(context).top + 20,
              bottom: 22,
            ),
            child: FATopNavigation(
              onPressLeft: () => GoRouter.of(context).go('/homeScreen'),
              title: context.l10n.categories,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: FASearchBox(),
          ),
          const SizedBox(height: 62),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: listCategory.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          AssetImage(listCategory[index].image ?? ''),
                    ),
                    const SizedBox(height: 21),
                    Text(
                      listCategory[index].name ?? '',
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
