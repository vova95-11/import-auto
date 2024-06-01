import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/common/widgets/reels/reels.dart';
import 'package:unit_auto/features/shop/controllers/reels_controller.dart';
import 'package:unit_auto/features/shop/screens/reels/reels_screen.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

import '../../../../../common/widgets/shimmer/reels_shimmer.dart';

class UHomeReels extends StatelessWidget {
  const UHomeReels({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reelsController = Get.put(ReelsController());

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        if (reelsController.isLoading.value) return const UReelsShimmer();

        if (reelsController.featuredReels.isEmpty) {
          return Center(
            child: Text(
              'Данные не найдены!',
              style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
            ),
          );
        }

        return SizedBox(
          height: 105,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: reelsController.featuredReels.length,
            padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
            separatorBuilder: (context, index) => const SizedBox(width: USizes.defaultSpace24 / 1.3),
            itemBuilder: (_, index) {
              final reels = reelsController.featuredReels[index];
              return UReels(
                image: reels.image,
                title: reels.name,
                onTap: () => Get.to(() => const ReelsScreen()),
              );
            },
          ),
        );
      }),
    );
  }
}
