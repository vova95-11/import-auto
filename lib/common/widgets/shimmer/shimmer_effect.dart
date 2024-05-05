import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class UShimmerEffect extends StatelessWidget {
  const UShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Padding(
        padding: padding,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? (dark ? UColors.darkGrey : UColors.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
