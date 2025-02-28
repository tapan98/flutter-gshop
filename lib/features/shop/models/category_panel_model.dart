import 'package:flutter/material.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_Page.dart';

class CategoryPanelModel {
  CategoryPanelModel({
    required this.navigationRailDestination,
    this.categoryId,
    required this.title,
    required this.image,
  });

  final NavigationRailDestination navigationRailDestination;
  final String title, image;
  String? categoryId;
}
