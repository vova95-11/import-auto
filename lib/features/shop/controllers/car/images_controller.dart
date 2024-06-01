import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/features/shop/models/car_model.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectedCarImage = ''.obs;

  /// -- Get All Images from car and Variations
  List<String> getAllCarImages(CarModel car) {
    // Use Set to add unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(car.thumbnail);

    // Assign Thumbnail as Selected Image
    selectedCarImage.value = car.thumbnail;

    // Get all images from the Car Model if not null
    if (car.images != null) {
      images.addAll(car.images!);
    }

    return images.toList();
  }

  /// -- Show Image Popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: USizes.defaultSpace24 * 2, horizontal: USizes.defaultSpace24),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: USizes.spaceBtwSections32),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: () => Get.back(), child: const Text('Закрыть')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
