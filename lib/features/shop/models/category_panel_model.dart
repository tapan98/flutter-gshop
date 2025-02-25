import 'package:flutter/material.dart';

class CategoryPanelModel {
  CategoryPanelModel({
    required this.navigationRailDestination,
    required this.destination,
  });

  final NavigationRailDestination navigationRailDestination;
  final Widget destination;
}
