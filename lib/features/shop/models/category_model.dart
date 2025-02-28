import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gshop/features/shop/models/sub_category_model.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  List<SubCategoryModel> subcategories;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.subcategories,
  });

  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        image: '',
        subcategories: [],
      );

  // convert from firestore document snapshot
  factory CategoryModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return CategoryModel.empty();
    }

    final data = document.data()!;

    return CategoryModel(
      id: document.id,
      name: data[nameKey] ?? '',
      image: data[imageKey] ?? '',
      subcategories: [], // to be fetched later
    );
  }

  // constants
  static const String nameKey = "Name";
  static const String imageKey = "Image";
}
