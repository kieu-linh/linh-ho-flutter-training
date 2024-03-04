// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class FAShimmer extends StatefulWidget {
  const FAShimmer({
    super.key,
    required this.width,
    required this.height,
    this.duration = const Duration(milliseconds: 1000),
  });

  final double width;
  final double height;
  final Duration duration;

  @override
  _FAShimmerState createState() => _FAShimmerState();
}

class _FAShimmerState extends State<FAShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          final gradient = LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.grey.shade200,
              Colors.grey.shade300,
              Colors.grey.shade200,
            ],
            stops: [
              0.0,
              0.5,
              1.0,
            ],
          );
          return DecoratedBox(
              decoration: BoxDecoration(
            gradient: gradient,
          ));
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
