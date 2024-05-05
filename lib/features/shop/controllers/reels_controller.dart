import 'package:get/get.dart';
import 'package:unit_auto/data/repositories/reels/reels_repository.dart';
import 'package:unit_auto/features/shop/models/reels_model.dart';
import 'package:unit_auto/utils/device/loaders.dart';

class ReelsController extends GetxController {
  static ReelsController get instance => Get.find();

  final isLoading = false.obs;
  final _reelsRepository = Get.put(ReelsRepository());
  RxList<ReelsModel> allReels = <ReelsModel>[].obs;
  RxList<ReelsModel> featuredReels = <ReelsModel>[].obs;

  @override
  void onInit() {
    fetchReels();
    super.onInit();
  }

  /// -- Load reels data
  Future<void> fetchReels() async {
    try {
      // Show loader while loading reels
      isLoading.value = true;

      // Fetch reels from data source (Firestore, API, etc.)
      final reels = await _reelsRepository.getAllReels();

      // Update the reels list
      allReels.assignAll(reels);

      // Filter featured reels
      featuredReels.assignAll(allReels.where((reels) => reels.isFeatured).toList());
    } catch (e) {
      ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  ///  -- Load selected reels data

  /// Get Reels or Sub-Category Products
}
