import 'package:fitness_app/data/models/category_data.dart';
import 'package:fitness_ui/components/search_box.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<CategoryModel> listSearchCategory = [];

  @override
  void initState() {
    listSearchCategory = listCategory;
    super.initState();
  }

  void _searchCategory(String value) {
    listSearchCategory = listCategory
        .where(
          (e) => (e.name ?? '').toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 22),
            child: FATopNavigation(
              onLeadingPress: () => GoRouter.of(context).go('/homeScreen'),
              title: s.categories,
            ),
          ),
          Padding(
            padding: context.padding(horizontal: 20),
            child: FASearchBox(
              onChanged: (value) {
                _searchCategory(value);
              },
            ),
          ),
          context.sizedBox(height: 62),
          Expanded(
            child: GridView.builder(
              padding: context.padding(horizontal: 24),
              itemCount: listSearchCategory.length,
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
                          AssetImage(listSearchCategory[index].image ?? ''),
                    ),
                    const SizedBox(height: 20),
                    FAText.bodyLarge(
                      context,
                      text: listSearchCategory[index].name ?? '',
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
