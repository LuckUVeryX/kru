import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFEBEBF4),
      highlightColor: const Color(0xFFF4F4F4),
      child: child,
    );
  }
}

class ShimmerText extends StatelessWidget {
  const ShimmerText({
    required this.textStyle,
    this.flex = 1,
    this.spacerFlex = 1,
    super.key,
  });

  final int flex;
  final int spacerFlex;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: flex,
          child: Container(
            color: Colors.black,
            height: textStyle?.fontSize,
          ),
        ),
        Spacer(flex: spacerFlex),
      ],
    );
  }
}
