import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/u_circular_image.dart';
import '../shimmer/shimmer_effect.dart';

class UUserProfileTile extends StatelessWidget {
  const UUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Obx(() {
          final networkImage = controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty ? networkImage : UImages.user;
          return controller.imageUploading.value
              ? const UShimmerEffect(
                  width: 50,
                  height: 50,
                  radius: 100,
                  padding: EdgeInsets.all(0),
                )
              : UCircularImage(image: image, width: 50, height: 50, padding: 0, isNetworkImage: networkImage.isNotEmpty);
        }),
        title: Obx(() {
          if (controller.profileLoading.value) {
            return const UShimmerEffect(width: 80, height: 15);
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
            );
          }
        }),
        subtitle: Obx(() {
          if (controller.profileLoading.value) {
            return const UShimmerEffect(width: 80, height: 15);
          } else {
            return Text(controller.user.value.phoneNumber, style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.white));
          }
        }),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.edit, color: UColors.white),
        ),
      ),
    );
  }
}
