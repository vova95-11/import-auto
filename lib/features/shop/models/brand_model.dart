import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  String location;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    required this.location,
  });

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', name: '', image: '', location: '');

  /// Convert model to Json structure so that you can store data in Firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'Location': location,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      location: data['Location'] ?? '',
    );
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return BrandModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        location: data['Location'] ?? '',
      );
    } else {
      return BrandModel.empty();
    }
  }
}
