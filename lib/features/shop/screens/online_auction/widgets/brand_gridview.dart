import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/common/widgets/layouts/grid_layout.dart';
import 'package:unit_auto/common/widgets/shimmer/brands_shimmer.dart';
import 'package:unit_auto/features/shop/controllers/brand_controller.dart';
import 'package:unit_auto/features/shop/screens/online_auction/widgets/brand_card.dart';
import 'package:unit_auto/features/shop/screens/online_auction/widgets/brand_cars.dart';

class BrandGridview extends StatelessWidget {
  const BrandGridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    return Obx(() {
      if (brandController.isLoading.value) return const UBrandsShimmer();

      if (brandController.japanBrands.isEmpty) {
        return Center(child: Text('Нет данных', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }
      return UGridLayout(
        crossAxisCount: 2,
        itemCount: brandController.japanBrands.length,
        mainAxisExtent: 50,
        itemBuilder: (_, index) {
          final brand = brandController.japanBrands[index];
          return UBrandCard(
            showBorder: true,
            brand: brand,
            onTap: () => Get.to(() => BrandCars(brand: brand)),
          );
        },
      );
    });
  }
}
