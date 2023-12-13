import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_svg/svg.dart';

class AppBarAuth extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAuth({
    super.key,
    this.text,
  });

  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24)
          .copyWith(top: MediaQuery.of(context).padding.top + 18),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/ic_back.svg'),
          const Spacer(),
          if (text != null)
            Text(
              text!,
              style: AppTextStyles.textAppBar,
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
