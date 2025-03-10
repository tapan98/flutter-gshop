import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gshop/features/shop/models/sub_category_item_model.dart';

/// Represents second-level category
class SubCategoryModel {
  final String id;
  final String title;
  List<SubCategoryItemModel> items;

  SubCategoryModel({
    required this.id,
    required this.title,
    required this.items,
  });

  // Methods

  static SubCategoryModel empty() =>
      SubCategoryModel(id: '', title: '', items: []);

  // get data from firestore document snapshot
  factory SubCategoryModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return SubCategoryModel.empty();
    }
    return SubCategoryModel(
      id: document.id,
      title: document.data()?[titleKey] ?? '',
      items: [], // to be fetched separately
    );
  }

  @override
  String toString() {
    return 'SubCategoryModel(id: $id, title: $title, items: $items)';
  }

  // Constants
  static const String titleKey = "SubCategoryTitle";
}
