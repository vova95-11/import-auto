import 'package:get/get.dart';
import 'package:unit_auto/data/repositories/cars/car_repository.dart';
import 'package:unit_auto/features/shop/models/car_model.dart';
import 'package:unit_auto/utils/device/loaders.dart';

class CarController extends GetxController {
  static CarController get instance => Get.find();

  final isLoading = false.obs;
  final carRepository = Get.put(CarRepository());
  RxList<CarModel> allCars = <CarModel>[].obs;

  @override
  void onInit() {
    // fetchAllCars();
    super.onInit();
  }

  // void fetchAllCars() async {
  //   try {
  //     // Show loader while loading Cars
  //     isLoading.value = true;

  //     // Fetch Cars
  //     final cars = await carRepository.getAllCars();
  //     allCars.assignAll(cars);

  //     // Assign Cars
  //   } catch (e) {
  //     ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
