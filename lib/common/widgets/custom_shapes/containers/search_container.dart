import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/device/device_utility.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class USearchContainer extends StatelessWidget {
  const USearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
        child: Container(
          width: UDeviceUtils.getScreenWidth(context) - USizes.defaultSpace24 * 2,
          padding: const EdgeInsets.all(USizes.md16),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? UColors.dark
                    : UColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(USizes.cardRadiusLg16),
            border: showBorder ? Border.all(color: UColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: dark ? UColors.darkerGrey : Colors.grey),
              const SizedBox(width: USizes.spaceBtwItems16),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
