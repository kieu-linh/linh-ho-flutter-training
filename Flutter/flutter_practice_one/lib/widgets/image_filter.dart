import 'dart:ui';

import 'package:flutter/material.dart';

class FAImageFilter extends StatelessWidget {
  const FAImageFilter({
    required this.image,
    this.sigmaX = 100,
    this.sigmaY = 100,
    super.key,
  });

  final String image;
  final double sigmaX;
  final double sigmaY;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: sigmaX,
              sigmaY: sigmaY,
            ),
            child: const SizedBox(),
          ),
        ),
      ],
    );
  }
}
