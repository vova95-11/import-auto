import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unit_auto/features/shop/models/reels_model.dart';
import 'package:unit_auto/utils/exceptions/firebase_exceptions.dart';
import 'package:unit_auto/utils/exceptions/platform_exceptions.dart';

class ReelsRepository extends GetxController {
  static ReelsRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Reels
  Future<List<ReelsModel>> getAllReels() async {
    try {
      final snapshot = await _db.collection('Reels').get();
      final list = snapshot.docs.map((document) => ReelsModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте еще раз.';
    }
  }

  /// Get Sub Reels

  /// Upload Reels to the Cloud Firebase
}
