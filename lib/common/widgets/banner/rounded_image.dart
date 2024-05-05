import 'package:flutter/material.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

class URoundedImage extends StatelessWidget {
  const URoundedImage({
    super.key,
    this.border,
    this.padding,
    this.margin,
    this.onPressed,
    this.width,
    this.height,
    this.applyImageRadius = true,
    this.applyImageRadiusOnly = false,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.backgroundColor = UColors.light,
    this.isNetworkImage = false,
    this.borderRadius = USizes.md16,
    this.topLeft = Radius.zero,
    this.topRight = Radius.zero,
    this.bottomLeft = Radius.zero,
    this.bottomRight = Radius.zero,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final bool applyImageRadiusOnly;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Radius topLeft;
  final Radius topRight;
  final Radius bottomLeft;
  final Radius bottomRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
        child: applyImageRadiusOnly
            ? ClipRRect(
                borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
                child: Image(fit: fit, image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider),
              )
            : ClipRRect(
                borderRadius: applyImageRadius ? BorderRadius.only(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight) : BorderRadius.zero,
                child: Image(fit: fit, image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider),
              ),
      ),
    );
  }
}
