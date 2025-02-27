import 'package:flutter/material.dart';

class CategoryPanelModel {
  CategoryPanelModel({
    required this.navigationRailDestination,
    required this.destination,
    required this.title,
    required this.image,
  });

  final NavigationRailDestination navigationRailDestination;
  final String title, image;
  final Widget destination;
}
