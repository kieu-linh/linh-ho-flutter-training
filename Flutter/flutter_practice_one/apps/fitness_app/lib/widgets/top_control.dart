import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/constant/icons.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_svg/svg.dart';

class FATopControl extends StatelessWidget {
  const FATopControl({
    this.onPressed,
    this.text,
    super.key,
  });

  final String? text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 18),
      child: Row(
        children: [
          GestureDetector(
            onTap: onPressed,
            child: SvgPicture.asset(FAIcons.iconBack),
          ),
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
}
