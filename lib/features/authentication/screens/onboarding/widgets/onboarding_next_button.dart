import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unit_auto/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/device/device_utility.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Positioned(
      right: USizes.defaultSpace24,
      bottom: UDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: dark ? UColors.primary : Colors.black),
          shape: const CircleBorder(),
          backgroundColor: dark ? UColors.primary : Colors.black,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
