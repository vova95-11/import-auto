import 'package:get/get.dart';
import 'package:unit_auto/data/repositories/brands/brand_repository.dart';
import 'package:unit_auto/data/repositories/cars/car_repository.dart';
import 'package:unit_auto/features/shop/models/brand_model.dart';
import 'package:unit_auto/features/shop/models/car_model.dart';
import 'package:unit_auto/utils/device/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  RxList<BrandModel> japanBrands = <BrandModel>[].obs;
  RxList<BrandModel> otherBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getJapanBrands();
    super.onInit();
  }

  /// -- Load Brands
  Future<void> getJapanBrands() async {
    try {
      // Show loader while loading Brands
      isLoading.value = true;

      final japanBrands = await brandRepository.getJapanBrands();

      // Assign Brands
      this.japanBrands.assignAll(japanBrands);
    } catch (e) {
      ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
    } finally {
      // Stop Loader
      isLoading.value = false;
    }
  }

  /// Get Brand Specific Cars from your data source
  Future<List<CarModel>> getBrandCars(String brandId) async {
    try {
      final cars = await CarRepository.instance.getCarsForBrand(brandId: brandId);
      print(brandId);
      return cars;
    } catch (e) {
      ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
      return [];
    }
  }
}
