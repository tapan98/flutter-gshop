import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '');

  // convert to map for firestore
  Map<String, dynamic> toMap() => {

    nameKey: name,
    imageKey: image,
  };

  // convert from firestore document snapshot
  factory CategoryModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return CategoryModel.empty();
    }

    final data = document.data()!;

    return CategoryModel(
      id: document.id,
      name: data[nameKey] ?? '',
      image: data[imageKey] ?? '',
    );
  }

  // constants
  static const String nameKey = "Name";
  static const String imageKey = "Image";
}
