import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/layouts/grid_layout.dart';
import 'package:unit_auto/common/widgets/shimmer/shimmer_effect.dart';

class UBrandsShimmer extends StatelessWidget {
  const UBrandsShimmer({super.key, this.itemCount = 12});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return UGridLayout(
      mainAxisExtent: 50,
      itemCount: itemCount,
      itemBuilder: (_, __) => const UShimmerEffect(width: 300, height: 50),
    );
  }
}
