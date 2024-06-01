import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unit_auto/common/widgets/appbar/appbar.dart';
import 'package:unit_auto/common/widgets/appbar/custom_appbar.dart';
import 'package:unit_auto/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:unit_auto/common/widgets/images/u_circular_image.dart';
import 'package:unit_auto/common/widgets/shimmer/shimmer_effect.dart';
import 'package:unit_auto/common/widgets/texts/section_heading.dart';
import 'package:unit_auto/features/personalization/controllers/user_controller.dart';
import 'package:unit_auto/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:unit_auto/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: UAppBar(
        text: UTexts.profileAppBarSubTitle,
        style: Theme.of(context).textTheme.headlineMedium,
        backgroundColor: Colors.white,
        shape: dark
            ? const Border(bottom: BorderSide(color: Color.fromARGB(255, 106, 106, 106), width: 1))
            : const Border(bottom: BorderSide(color: Color.fromARGB(255, 207, 207, 207), width: 1)),
        color: Colors.black,
        showBackArrow: true,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24, vertical: USizes.defaultSpace24),
              child: Column(
                children: [
                  /// Profile Pecture
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Obx(() {
                          final networkImage = controller.user.value.profilePicture;
                          final image = networkImage.isNotEmpty ? networkImage : UImages.user;
                          return controller.imageUploading.value
                              ? const UShimmerEffect(
                                  width: 80,
                                  height: 80,
                                  radius: 100,
                                  padding: EdgeInsets.all(USizes.sm8),
                                )
                              : UCircularImage(image: image, width: 95, height: 95, isNetworkImage: networkImage.isNotEmpty);
                        }),
                        TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Изменить фото')),
                      ],
                    ),
                  ),

                  /// Details
                  const SizedBox(height: USizes.spaceBtwItems16 / 2),
                  const Divider(),
                  const SizedBox(height: USizes.spaceBtwItems16),

                  /// Heading Profile Info
                  const USectionHeading(title: 'Личные данные', showActionButton: false),
                  const SizedBox(height: USizes.spaceBtwItems16),

                  Obx(() {
                    if (controller.profileLoading.value) {
                      // Display a shimmer loader while user profile is being loaded
                      return const UShimmerEffect(width: 280, height: 15, padding: EdgeInsets.symmetric(vertical: 12));
                    } else {
                      return UProfileMenu(onPressed: () => Get.to(() => const ChangeName()), title: 'Имя', value: controller.user.value.firstName);
                    }
                  }),
                  Obx(() {
                    if (controller.profileLoading.value) {
                      // Display a shimmer loader while user profile is being loaded
                      return const UShimmerEffect(width: 280, height: 15, padding: EdgeInsets.symmetric(vertical: 12));
                    } else {
                      return UProfileMenu(onPressed: () => Get.to(() => const ChangeName()), title: 'Фамилия', value: controller.user.value.lastName);
                    }
                  }),

                  const SizedBox(height: USizes.spaceBtwItems16),
                  const Divider(),
                  const SizedBox(height: USizes.spaceBtwItems16),

                  /// Heading Personal Info
                  const USectionHeading(title: 'Персональная информация', showActionButton: false),
                  const SizedBox(height: USizes.spaceBtwItems16),

                  Obx(() {
                    if (controller.profileLoading.value) {
                      // Display a shimmer loader while user profile is being loaded
                      return const UShimmerEffect(width: 280, height: 15, padding: EdgeInsets.symmetric(vertical: 12));
                    } else {
                      return UProfileMenu(onPressed: () {}, title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy);
                    }
                  }),
                  Obx(() {
                    if (controller.profileLoading.value) {
                      // Display a shimmer loader while user profile is being loaded
                      return const UShimmerEffect(width: 280, height: 15, padding: EdgeInsets.symmetric(vertical: 12));
                    } else {
                      return UProfileMenu(onPressed: () {}, title: 'E-mail', value: controller.user.value.email);
                    }
                  }),
                  Obx(() {
                    if (controller.profileLoading.value) {
                      // Display a shimmer loader while user profile is being loaded
                      return const UShimmerEffect(width: 280, height: 15, padding: EdgeInsets.symmetric(vertical: 12));
                    } else {
                      return UProfileMenu(onPressed: () {}, title: 'Номер телефона', value: controller.user.value.phoneNumber);
                    }
                  }),
                  UProfileMenu(onPressed: () {}, title: 'Пол', value: 'Мужской'),
                  UProfileMenu(onPressed: () {}, title: 'День рождения', value: '22.05.1995'),
                  const SizedBox(height: USizes.spaceBtwItems16 / 2),
                  const Divider(),
                  const SizedBox(height: USizes.spaceBtwItems16 / 2),

                  Center(
                    child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text(
                        'Удалить аккаунт',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 400),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
