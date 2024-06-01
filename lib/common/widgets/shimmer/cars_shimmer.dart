import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/layouts/grid_layout.dart';
import 'package:unit_auto/common/widgets/shimmer/shimmer_effect.dart';

class UCarShimmer extends StatelessWidget {
  const UCarShimmer({super.key, this.itemCount = 20});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return UGridLayout(
      mainAxisExtent: 30,
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UShimmerEffect(width: 100, height: 25),
          ],
        ),
      ),
    );
  }
}
