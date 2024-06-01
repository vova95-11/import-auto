import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unit_auto/common/widgets/images/u_circular_image.dart';
import 'package:unit_auto/common/widgets/texts/u_brand_title_with_icon.dart';
import 'package:unit_auto/features/shop/models/brand_model.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/enums.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: URoundedContainer(
        padding: const EdgeInsets.all(USizes.sm8),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// -- Icon
            Expanded(
              flex: 1,
              child: UCircularImage(
                padding: 2,
                width: 20,
                height: 20,
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? UColors.white : UColors.dark,
              ),
            ),
            const SizedBox(width: USizes.spaceBtwItems16 / 4),

            /// -- Text
            Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UBrandTitleWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
