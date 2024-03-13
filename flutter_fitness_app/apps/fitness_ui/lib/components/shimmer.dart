import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FAShimmer extends StatelessWidget {
  const FAShimmer({
    required this.child,
    super.key,
  });

  factory FAShimmer.goal() {
    return FAShimmer(
      child: SizedBox(
        height: 55,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: 4,
          itemBuilder: (context, index) {
            return const Column(
              children: [
                ShimmerWidget.rectangular(height: 32, width: 90),
                SizedBox(height: 20),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 16),
        ),
      ),
    );
  }

  factory FAShimmer.category() {
    return FAShimmer(
        child: SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              ShimmerWidget.circular(height: 60, width: 60),
              SizedBox(height: 10),
              ShimmerWidget.rectangular(height: 15, width: 30),
              SizedBox(height: 10),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 16),
      ),
    ));
  }

  factory FAShimmer.meal() {
    return FAShimmer(
        child: SizedBox(
      height: 350,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 2,
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.rectangular(height: 150, width: 300),
              SizedBox(height: 10),
              ShimmerWidget.rectangular(height: 15, width: 200),
              SizedBox(height: 5),
              ShimmerWidget.rectangular(height: 15, width: 100),
              SizedBox(height: 5),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    ));
  }

  factory FAShimmer.exercise() {
    return FAShimmer(
        child: SizedBox(
      height: 500,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Row(
            children: [
              ShimmerWidget.rectangular(height: 90, width: 90),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangular(height: 20, width: 200),
                  SizedBox(height: 5),
                  ShimmerWidget.rectangular(height: 15, width: 100),
                  SizedBox(height: 5),
                  ShimmerWidget.rectangular(height: 10, width: 50),
                  SizedBox(height: 5),
                ],
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    ));
  }

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget.rectangular({
    required this.height,
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    this.width = double.infinity,
    super.key,
  });

  const ShimmerWidget.circular({
    required this.height,
    this.shape = const CircleBorder(),
    this.width = double.infinity,
    super.key,
  });

  final double width;
  final double height;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: shape,
        ),
      ),
    );
  }
}
