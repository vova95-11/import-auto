import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unit_auto/common/widgets/appbar/appbar.dart';

import 'package:unit_auto/common/widgets/shimmer/cars_shimmer.dart';

import 'package:unit_auto/features/shop/controllers/brand_controller.dart';
import 'package:unit_auto/features/shop/models/brand_model.dart';
import 'package:unit_auto/features/shop/screens/online_auction/widgets/cars.dart';

import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/helpers/cloud_helper_function.dart';

class BrandCars extends StatelessWidget {
  const BrandCars({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        text: brand.name,
        // title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
          child: Column(
            children: [
              FutureBuilder(
                  future: controller.getBrandCars(brand.id),
                  builder: (context, snapshot) {
                    /// Handle Loader, No Record, OR Error Message
                    const loader = UCarShimmer();
                    final widget = UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found!
                    final brandCars = snapshot.data!;
                    return UCars(cars: brandCars);

                    // return UGridLayout(
                    //   crossAxisCount: 3,
                    //   mainAxisExtent: 40,
                    //   itemCount: 6,
                    //   itemBuilder: (_, index) {
                    //     return URoundedContainer(
                    //       borderColor: Colors.red,
                    //       padding: const EdgeInsets.all(USizes.sm8),
                    //       showBorder: true,
                    //       backgroundColor: Colors.transparent,
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           UBrandTitleWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large),
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
