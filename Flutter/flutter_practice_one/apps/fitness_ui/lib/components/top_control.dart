import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FATopControl extends StatelessWidget {
  const FATopControl({
    required this.onPressed,
    this.text,
    super.key,
    this.onTap,
  });

  final String? text;
  final VoidCallback onPressed;
  final VoidCallback? onTap;
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
            GestureDetector(
              onTap: onTap,
              child: Text(
                text!,
                style: AppTextStyles.textAppBar,
              ),
            ),
        ],
      ),
    );
  }
}
