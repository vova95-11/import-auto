import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unit_auto/features/shop/models/brand_model.dart';
import 'package:unit_auto/utils/exceptions/firebase_exceptions.dart';
import 'package:unit_auto/utils/exceptions/format_exceptions.dart';
import 'package:unit_auto/utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get Japan Brands
  Future<List<BrandModel>> getJapanBrands() async {
    try {
      final snapshot = await _db.collection('Brands').where('Location', isEqualTo: 'Japan').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте еще раз.';
    }
  }
}
