import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';

class FAUserInfo extends StatelessWidget {
  const FAUserInfo({
    required this.image,
    required this.name,
    required this.weight,
    required this.height,
    required this.age,
    super.key,
  });
  final String image;
  final String name;
  final double weight;
  final double height;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(top: 12, bottom: 33),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(height: 13),
          Text(
            '${name.toUpperCase()}!',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.tertiaryContainer,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            context.l10n.basicMemberText,
            style: context.textTheme.titleSmall
                ?.copyWith(color: context.colorScheme.tertiary),
          ),
          context.sizedBox(height: 46),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FAItemInfo(
                textFist: '$weight',
                textSecond: context.l10n.kg,
                textThird: context.l10n.weight,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                width: 1,
                height: 20,
                color: context.colorScheme.outlineVariant,
              ),
              FAItemInfo(
                textFist: '$height',
                textSecond: context.l10n.cm,
                textThird: context.l10n.height,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                width: 1,
                height: 20,
                color: context.colorScheme.outlineVariant,
              ),
              FAItemInfo(
                textFist: '$age',
                textSecond: context.l10n.year,
                textThird: context.l10n.age,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FAItemInfo extends StatelessWidget {
  const FAItemInfo({
    required this.textFist,
    required this.textSecond,
    required this.textThird,
    super.key,
  });

  final String textFist;
  final String textSecond;
  final String textThird;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: textFist,
            style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
            children: [
              TextSpan(
                text: textSecond.toLowerCase(),
                style: context.textTheme.titleMedium?.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          textThird,
          style: context.textTheme.titleMedium?.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}
