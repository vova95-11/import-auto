import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unit_auto/common/widgets/images/u_circular_image.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class UReels extends StatelessWidget {
  const UReels({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.textColor = UColors.white,
    this.isNetworkImage = true,
    this.backgroundColor,
  });

  final Color textColor;
  final String image, title;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          /// Circular Icon
          UCircularImage(
            width: 70,
            height: 80,
            borderRadius: 10,
            image: image,
            fit: BoxFit.fitWidth,
            padding: USizes.sm8 * 1.4,
            isNetworkImage: isNetworkImage,
            backgroundColor: backgroundColor,
            overlayColor: dark ? UColors.light : UColors.dark,
          ),
          // Container(
          //   width: 70,
          //   height: 80,
          //   padding: const EdgeInsets.all(USizes.sm8),
          //   decoration: BoxDecoration(
          //       color: backgroundColor ?? (dark ? UColors.black : UColors.white),
          //       //borderRadius: BorderRadius.circular(100),
          //       borderRadius: const BorderRadius.all(Radius.circular(10))),
          //   child: Center(
          //     child: Image(
          //       image: AssetImage(image),
          //       fit: BoxFit.cover,
          //       color: dark ? UColors.light : UColors.dark,
          //     ),
          //   ),
          // ),

          /// Text
          const SizedBox(height: USizes.spaceBtwItems16 / 2),
          SizedBox(
            width: 70,
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
