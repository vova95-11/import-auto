import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unit_auto/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unit_auto/common/widgets/texts/u_brand_title_with_icon.dart';

import 'package:unit_auto/features/shop/models/car_model.dart';
import 'package:unit_auto/features/shop/screens/online_auction/widgets/car_filtered_screen.dart';
import 'package:unit_auto/utils/constants/enums.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

class UCarTitle extends StatelessWidget {
  const UCarTitle({super.key, required this.showBorder, required this.car});

  final CarModel car;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => CarFilteredScreen(car: car)),
      child: URoundedContainer(
        padding: const EdgeInsets.all(USizes.sm8),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UBrandTitleWithVerifiedIcon(title: car.name, brandTextSize: TextSizes.large),
          ],
        ),
      ),
    );
  }
}
