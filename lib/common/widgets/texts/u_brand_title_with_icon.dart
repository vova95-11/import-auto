import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unit_auto/common/widgets/texts/u_brand_title_text.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/enums.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

class UBrandTitleWithVerifiedIcon extends StatelessWidget {
  const UBrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = UColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: UBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: USizes.xs4),
        Icon(Iconsax.verify5, color: iconColor, size: USizes.iconsXs12),
      ],
    );
  }
}
