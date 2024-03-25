// ignore_for_file: file_names, inference_failure_on_function_return_type
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:flutter/material.dart';

class FABodyMeasurementInput extends StatefulWidget {
  const FABodyMeasurementInput({
    this.validator,
    this.textRight,
    this.textLeft,
    this.controller,
    super.key,
    this.onLeftPressed,
    this.onRightPressed,
    this.onChange,
  });

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? textRight;
  final String? textLeft;
  final Function(String)? onChange;
  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;

  @override
  State<FABodyMeasurementInput> createState() => _FAInputBodyMeasurementState();
}

class _FAInputBodyMeasurementState extends State<FABodyMeasurementInput> {
  int _selectIndex = 1;

  void onTap(int index) {
    if (_selectIndex == index) return;
    _selectIndex = index;
    if (index == 0) {
      widget.onLeftPressed?.call();
    } else {
      widget.onRightPressed?.call();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final sizeText = size.width * 0.5 - 28;

    return Column(
      children: [
        Container(
          padding: context.padding(horizontal: 17, vertical: 8),
          decoration: BoxDecoration(
            color: context.colorScheme.onSurfaceVariant.withOpacity(0.25),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(2, (index) {
              return GestureDetector(
                onTap: () => onTap(index),
                child: Container(
                  padding: context.padding(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: _selectIndex == index
                        ? context.colorScheme.secondary
                        : context.colorScheme.onTertiary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    index == 0 ? widget.textLeft ?? '' : widget.textRight ?? '',
                    style: AppTextStyles.textBottom.copyWith(fontSize: 22),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: context.padding(vertical: 4),
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            border: Border.all(
              color: context.colorScheme.outlineVariant.withOpacity(0.25),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                controller: widget.controller,
                onChanged: widget.onChange,
                validator: widget.validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxWidth: sizeText,
                  ),
                  border: InputBorder.none,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 1,
                height: 19,
                color: context.colorScheme.outline,
              ),
              Text(
                (_selectIndex != 0
                        ? widget.textRight?.toLowerCase()
                        : widget.textLeft?.toLowerCase()) ??
                    '',
                style: AppTextStyles.textStepPage.copyWith(fontSize: 22),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
