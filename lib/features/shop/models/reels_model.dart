import 'package:cloud_firestore/cloud_firestore.dart';

class ReelsModel {
  String id;
  String name;
  String image;
  bool isFeatured;

  ReelsModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
  });

  /// Empty Helper Function
  static ReelsModel empty() => ReelsModel(
        id: '',
        name: '',
        image: '',
        isFeatured: false,
      );

  /// Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory ReelsModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return ReelsModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return ReelsModel.empty();
    }
  }
}
