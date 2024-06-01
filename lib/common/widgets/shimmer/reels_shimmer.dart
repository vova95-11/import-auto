import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/shimmer/shimmer_effect.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

class UReelsShimmer extends StatelessWidget {
  const UReelsShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
        separatorBuilder: (_, __) => const SizedBox(width: USizes.defaultSpace24 / 1.3),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              UShimmerEffect(width: 70, height: 80, radius: 10),
              SizedBox(height: USizes.spaceBtwItems16 / 2),

              /// Text
              UShimmerEffect(width: 70, height: 8),
            ],
          );
        },
      ),
    );
  }
}
