import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unit_auto/common/widgets/layouts/grid_layout.dart';

import 'package:unit_auto/features/shop/controllers/all_cars_controller.dart';
import 'package:unit_auto/features/shop/models/car_model.dart';
import 'package:unit_auto/features/shop/screens/online_auction/widgets/car_title.dart';

class UCars extends StatelessWidget {
  const UCars({super.key, required this.cars});

  final List<CarModel> cars;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllCarsController());
    controller.assignCars(cars);
    return UGridLayout(
      mainAxisExtent: 40,
      crossAxisCount: 3,
      itemCount: controller.cars.length,
      itemBuilder: (_, index) => UCarTitle(car: controller.cars[index], showBorder: true),
    );

    // URoundedContainer(
    //   borderColor: Colors.red,
    //   padding: const EdgeInsets.all(USizes.sm8),
    //   showBorder: true,
    //   backgroundColor: Colors.transparent,
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       UBrandTitleWithVerifiedIcon(title: 'brand.name', brandTextSize: TextSizes.large),
    //     ],
    //   ),
    // );
  }
}
