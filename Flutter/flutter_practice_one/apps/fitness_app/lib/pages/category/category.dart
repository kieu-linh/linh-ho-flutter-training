import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/constant/icons.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_practice_one/data/models/category_data.dart';
import 'package:flutter_practice_one/widgets/search_box.dart';
import 'package:flutter_svg/svg.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(
            top: MediaQuery.of(context).padding.top + 20,
            bottom: 22,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                FAIcons.iconMenu,
                // ignore: deprecated_member_use
                color: context.colorScheme.tertiaryContainer,
              ),
              Text(
                'Categories',
                style: AppTextStyles.textButtonMedium
                    .copyWith(color: context.colorScheme.tertiary),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SearchBox(),
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
        )
      ]),
    );
  }
}
