import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gshop/features/shop/models/sub_category_model.dart';

/// Represents [SubCategoryModel]'s [items]
class SubCategoryItemModel {
  String id;
  String name;
  String image;

  SubCategoryItemModel({
    required this.id,
    required this.name,
    required this.image,
  });

  static SubCategoryItemModel empty() => SubCategoryItemModel(
        id: '',
        name: '',
        image: '',
      );

  factory SubCategoryItemModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return SubCategoryItemModel.empty();
    }
    final data = document.data()!;

    return SubCategoryItemModel(
      id: document.id,
      name: data[nameKey] ?? '',
      image: data[imageKey] ?? '',
    );
  }


  @override
  String toString() {
    return 'SubCategoryItemModel(id: $id, name: $name, image: $image)';
  }

  // Constants
  static const String nameKey = "Name";
  static const String imageKey = "Image";
}
