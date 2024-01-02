import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/constant/icons.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_svg/svg.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder({Color? color}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 2,
          color: context.colorScheme.outline.withOpacity(0.25),
        ),
      );
    }

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: context.colorScheme.secondary,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 13),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        prefixIcon: SvgPicture.asset(FAIcons.iconSearch),
        hintText: context.l10n.search,
        prefixIconConstraints:
            const BoxConstraints(maxHeight: 24, minWidth: 50),
      ),
    );
  }
}
