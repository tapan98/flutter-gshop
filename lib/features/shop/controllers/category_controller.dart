import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:gshop/common/widgets/custom_shapes/container/circular_image_text.dart';
import 'package:gshop/features/shop/models/category_model.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_section.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in CategoriesScreen
class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  // Variables
  final RxInt selectedIndex = 0.obs;
  final sectionScrollController = ScrollController();

  // TODO: To be dynamically fetched
  final RxList<CategoryModel> categories = [
    "Appliances",
    "Mobiles",
    "Electronics",
    "Toys",
    "Personal Care",
    "Furniture",
    "Clothes",
    "Travel",
    "Bikes & Scooters",
    "Services"
  ]
     .asMap().entries .map(
        (entry) => CategoryModel(
          navigationRailDestination: NavigationRailDestination(
              icon: FaIcon(FontAwesomeIcons.cubesStacked),
              label: Text(entry.value, textAlign: TextAlign.center)),
          destination: CategorySection(sectionTitle: "${entry.key} Trending now",),
        ),
      )
      .toList()
      .obs;

  // Methods
  List<NavigationRailDestination> getCategories() {
    // TODO: fetch categories
    return categories.map((item) => item.navigationRailDestination).toList();
  }

  List<Widget> getDestinations() {
    // TODO: fetch category destinations
    return categories.map((item) => item.destination).toList();
  }

  void onCategorySelected(int index) {
    selectedIndex.value = index;
    if (sectionScrollController.hasClients) {
      sectionScrollController.animateTo(0, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    }
  }

  @override
  void onClose() {
    Log.debug("Disposing sectionScrollController ...");
    sectionScrollController.dispose();
    super.onClose();

  }
}
