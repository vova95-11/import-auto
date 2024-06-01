import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unit_auto/features/shop/models/brand_model.dart';

class CarModel {
  String id;
  String name;
  double price;
  DateTime? date;
  BrandModel? brand;
  List<String>? images;
  String thumbnail;

  CarModel({
    required this.id,
    required this.name,
    required this.price,
    required this.brand,
    required this.thumbnail,
    this.images,
    this.date,
  });

  /// Create Empty func for clean code
  static CarModel empty() => CarModel(id: '', name: '', price: 0, thumbnail: '', brand: BrandModel(id: '', name: '', image: '', location: ''));

  /// Json Format
  toJson() {
    return {
      'Name': name,
      'Price': price,
      'Brand': brand!.toJson(),
      'Images': images ?? [],
      'Thumbnail': thumbnail,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory CarModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return CarModel.empty();
    final data = document.data()!;
    return CarModel(
      id: document.id,
      name: data['Name'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      thumbnail: data['Thumbnail'] ?? '',
    );
  }

  /// Map Json-oriented document snapshot from Firebase to Model
  factory CarModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return CarModel(
      id: document.id,
      name: data['Name'] ?? '',
      price: double.parse((['Price'] ?? 0.0).toString()),
      brand: BrandModel.fromJson(data['Brand']),
      thumbnail: data['Thumbnail'] ?? '',
    );
  }
}
