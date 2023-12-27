import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_svg/svg.dart';

class FAButton extends StatelessWidget {
  FAButton({
    required this.text,
    required this.onPressed,
    this.height = 55,
    this.color = AppColor.primary,
    this.borderColor,
    this.icon,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    super.key,
    this.border,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.iconColor,
  })  : borderRadius = borderRadius ?? BorderRadius.circular(10),
        textStyle = textStyle ?? AppTextStyles.textButtonMedium;

  FAButton.outline({
    required this.text,
    required this.onPressed,
    this.height = 55,
    this.color = AppColor.onSecondary,
    this.borderColor,
    this.icon,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    super.key,
    Border? border,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.iconColor,
  })  : borderRadius = borderRadius ?? BorderRadius.circular(10),
        textStyle = textStyle ?? AppTextStyles.textButtonSmall,
        border = border ??
            Border.all(color: AppColor.outlineColor.withOpacity(0.25));

  // ignore: lines_longer_than_80_chars
  FAButton.text({
    required this.text,
    required this.onPressed,
    this.height = 55,
    this.color = AppColor.buttonFaceColor,
    this.borderColor,
    this.icon,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    super.key,
    this.border,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.iconColor,
  })  : borderRadius = borderRadius ?? BorderRadius.circular(10),
        textStyle = textStyle ??
            AppTextStyles.textButtonSmall.copyWith(
              color: AppColor.secondary,
            );

  final VoidCallback onPressed;
  final double height;
  final Color color;
  final Color? borderColor;
  final String text;
  final TextStyle textStyle;
  final Border? border;
  final String? icon;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color,
          border: border,
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 11),
                child: SvgPicture.asset(
                  icon!,
                  // ignore: deprecated_member_use
                  color: iconColor,
                  width: 24,
                  height: 24,
                  fit: BoxFit.fill,
                ),
              ),
            Text(
              text,
              style: textStyle,
            ),
            if (icon != null) const SizedBox(width: 22),
          ],
        ),
      ),
    );
  }
}
