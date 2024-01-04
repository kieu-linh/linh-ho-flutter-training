import 'package:flutter/material.dart';

class FALoadingIndicator extends StatelessWidget {
  const FALoadingIndicator({
    super.key,
    required this.height,
    required this.textColor,
  });

  final double height;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: height - 22.0,
        child: CircularProgressIndicator(
          color: textColor,
          strokeWidth: 2.2,
        ),
      ),
    );
  }
}
