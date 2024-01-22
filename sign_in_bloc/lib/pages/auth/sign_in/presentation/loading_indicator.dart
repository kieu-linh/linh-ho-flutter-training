import 'package:flutter/material.dart';

class FALoadingIndicator extends StatelessWidget {
  const FALoadingIndicator({
    this.height = 33,
    this.textColor,
    super.key,
  });

  final double? height;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: height,
        child: CircularProgressIndicator(
          color: textColor,
          strokeWidth: 2.2,
        ),
      ),
    );
  }
}
