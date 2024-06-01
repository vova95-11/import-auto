import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/banner/rounded_image.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unit_auto/common/widgets/texts/auction_card_text.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class AuctionCard extends StatelessWidget {
  const AuctionCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
  });

  final void Function()? onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 28,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(6.0, 6.0),
              spreadRadius: 1.0,
              blurRadius: 15,
            ),
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(-6.0, -6.0),
              spreadRadius: 1.0,
              blurRadius: 15,
            ),
          ],
          // boxShadow: [UShadowStyle.verticalCardShadow],
          borderRadius: BorderRadius.circular(USizes.productImageRadius16),
          color: dark ? UColors.darkerGrey : UColors.white,
        ),
        child: Column(
          children: [
            URoundedContainer(
              // height: 80,
              // height: MediaQuery.of(context).size.width / 2 + 35,
              // padding: const EdgeInsets.only(bottom: USizes.sm8),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: const URoundedImage(
                imageUrl: UImages.auctionCard,
                applyImageRadiusOnly: false,
                applyImageRadius: true,
                topLeft: Radius.circular(USizes.productImageRadius16),
                topRight: Radius.circular(USizes.productImageRadius16),
                padding: EdgeInsets.only(top: 2.0, left: 2.0, right: 2.0),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: USizes.spaceBtwItems16 / 2),
                Padding(
                  padding: const EdgeInsets.only(left: USizes.xs4),
                  child: UAuctionCardText(
                    title: title,
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: USizes.xs4),
                  child: UAuctionCardText(
                    title: subtitle,
                    smallSize: true,
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: USizes.spaceBtwItems16 / 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
