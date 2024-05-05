import 'package:get/get.dart';
import 'package:unit_auto/data/repositories/banners/banner_repository.dart';
import 'package:unit_auto/features/shop/models/banner_model.dart';
import 'package:unit_auto/utils/device/loaders.dart';

class BannerController extends GetxController {
  /// Variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update Page Navigational Dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading reels
      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
