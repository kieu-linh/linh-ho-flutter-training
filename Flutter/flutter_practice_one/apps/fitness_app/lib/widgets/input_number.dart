import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';

class FAInputNumber extends StatefulWidget {
  const FAInputNumber({
    required this.textRight,
    required this.textLeft,
    this.controller,
    super.key,
  });

  final TextEditingController? controller;
  final String textRight;
  final String textLeft;

  @override
  State<FAInputNumber> createState() => _FAInputNumberState();
}

class _FAInputNumberState extends State<FAInputNumber> {
  int _selectIndex = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
          decoration: BoxDecoration(
            color: AppColor.surfaceContainer.withOpacity(0.25),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(2, (index) {
              return GestureDetector(
                onTap: () {
                  _selectIndex = index;
                  setState(() {});
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: _selectIndex == index
                        ? AppColor.secondary
                        : AppColor.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    index == 0 ? widget.textLeft : widget.textRight,
                    style: AppTextStyles.textBottom.copyWith(fontSize: 22),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: AppColor.secondary,
            border: Border.all(color: AppColor.outlineButton.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                controller: widget.controller,
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.5 - 28,
                  ),
                  border: InputBorder.none,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 1,
                height: 19,
                color: AppColor.outlineColor,
              ),
              Text(
                widget.textRight.toLowerCase(),
                style: AppTextStyles.textStepPage.copyWith(fontSize: 22),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
