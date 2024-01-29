import 'package:fitness_app/data/models/category_data.dart';
import 'package:fitness_app/pages/home/widgets/title.dart';
import 'package:fitness_ui/components/divider.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';




class FACategoryItem extends StatelessWidget {
  const FACategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);
    
    return Column(
      children: [
        FATitleHome(
          onPressed: () {
            GoRouter.of(context).goNamed('categoryScreen');
          },
          title: s.category,
          titleSmall: s.seeAll,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: List.generate(listCategory.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 19),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage(listCategory[index].image ?? ''),
                      ),
                      const SizedBox(height: 10),
                      FAText.bodyLarge(
                        context,
                        text: listCategory[index].name ?? '',
                        style:
                            context.textTheme.bodyLarge?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
        const FADivider(height: 36),
      ],
    );
  }
}
