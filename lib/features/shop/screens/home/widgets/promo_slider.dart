import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/common/widgets/banner/rounded_image.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:unit_auto/common/widgets/shimmer/shimmer_effect.dart';
import 'package:unit_auto/features/shop/controllers/banner_controller.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        // Loader
        if (controller.isLoading.value) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
            child: UShimmerEffect(width: double.infinity, height: 200),
          );
        }

        // No data found
        if (controller.banners.isEmpty) {
          return const Center(child: Text('Данные не найдены!'));
        } else {
          return Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) => controller.updatePageIndicator(index),
                  ),
                  items: controller.banners
                      .map((banner) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                            child: URoundedImage(
                              imageUrl: banner.imageUrl,
                              isNetworkImage: true,
                              onPressed: () => Get.toNamed(banner.targetScreen),
                              width: double.infinity,
                              topLeft: const Radius.circular(USizes.productImageRadius16),
                              topRight: const Radius.circular(USizes.productImageRadius16),
                              bottomLeft: const Radius.circular(USizes.productImageRadius16),
                              bottomRight: const Radius.circular(USizes.productImageRadius16),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: USizes.spaceBtwItems16),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        UCircularContainer(
                          margin: const EdgeInsets.only(right: 10),
                          width: 20,
                          height: 4,
                          backgroundColor: controller.carouselCurrentIndex.value == i ? UColors.primary : UColors.grey,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
