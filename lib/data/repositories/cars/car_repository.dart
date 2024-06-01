import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unit_auto/features/shop/models/car_model.dart';
import 'package:unit_auto/utils/exceptions/firebase_exceptions.dart';
import 'package:unit_auto/utils/exceptions/platform_exceptions.dart';

class CarRepository extends GetxController {
  // static CarRepository get instance => Get.find(); // После обновления flutter стало выдавать ошибку !!!!
  static CarRepository get instance => Get.put(CarRepository()); // Почему тут put, а везде find ???

  final _db = FirebaseFirestore.instance;

  /// Get All cars
  Future<List<CarModel>> fetchCarsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<CarModel> carList = querySnapshot.docs.map((doc) => CarModel.fromQuerySnapshot(doc)).toList();
      return carList;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте еще раз.';
    }
  }

  Future<List<CarModel>> getCarsForBrand({required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db.collection('Cars').where('Brand.Id', isEqualTo: brandId).get()
          : await _db.collection('Cars').where('Brand.Id', isEqualTo: brandId).limit(limit).get();
      final cars = querySnapshot.docs.map((doc) => CarModel.fromSnapshot(doc)).toList();
      print(cars.length);
      return cars;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте еще раз.';
    }
  }
}
