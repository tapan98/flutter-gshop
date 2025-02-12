import 'package:flutter/material.dart';

class CategoryModel {
  CategoryModel({
    required this.navigationRailDestination,
    required this.destination,
  });

  final NavigationRailDestination navigationRailDestination;
  final Widget destination;
}
