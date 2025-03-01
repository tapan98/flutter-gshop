import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gshop/features/shop/models/sub_category_model.dart';

/// Represents the top-level category
class CategoryModel {
  final String id;
  final String name;
  final String image;

  /// list of [SubCategoryModel]
  ///
  /// The [null] state represents that the list hasn't been fetched at least once,
  /// the empty list represents that subcategories couldn't be fetched and
  /// is not to be fetched again to minimize server requests
  List<SubCategoryModel>? subCategories;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.subCategories,
  });

  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        image: '',
        subCategories: [],
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
      //subCategories to be fetched later
    );
  }

  // constants
  static const String nameKey = "Name";
  static const String imageKey = "Image";
}
