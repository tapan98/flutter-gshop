import 'package:flutter/material.dart';

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
