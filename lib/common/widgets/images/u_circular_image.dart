import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/shimmer/shimmer_effect.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class UCircularImage extends StatelessWidget {
  const UCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.borderRadius = 100,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = USizes.sm8,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding, borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        // if image background color is null then switch it to light and dark mode color design
        // если цвет фона изображения равен нулю, то переключите его в режим светлого и темного цветового оформления
        color: backgroundColor ?? (UHelperFunctions.isDarkMode(context) ? UColors.black : UColors.white),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) => const UShimmerEffect(
                    width: 95,
                    height: 95,
                    radius: 100,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              // : Icon(Icons.error),
              : Image(
                  fit: fit,
                  image: AssetImage(image),
                  color: overlayColor,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                ),
        ),
      ),
    );
  }
}
