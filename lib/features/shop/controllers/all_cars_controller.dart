import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:unit_auto/data/repositories/cars/car_repository.dart';
import 'package:unit_auto/features/shop/models/car_model.dart';
import 'package:unit_auto/utils/device/loaders.dart';

class AllCarsController extends GetxController {
  static AllCarsController get instance => Get.find();

  final repository = CarRepository.instance;
  final RxList<CarModel> cars = <CarModel>[].obs;

  Future<List<CarModel>> fetchCarsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final cars = await repository.fetchCarsByQuery(query);
      return cars;
    } catch (e) {
      ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
      return [];
    }
  }

  void assignCars(List<CarModel> cars) {
    // Assign cars to the 'cars' list
    this.cars.assignAll(cars);
  }
}
