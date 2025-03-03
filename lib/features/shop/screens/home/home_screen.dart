import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/controllers/products_controller.dart';
import 'package:gshop/features/shop/screens/home/widgets/home_header.dart';
import 'package:gshop/features/shop/screens/home/widgets/home_popular_products_section.dart';
import 'package:gshop/features/shop/screens/home/widgets/home_product_categories.dart';
import 'package:gshop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = Get.put(ProductsController());
    HelperFunctions.setDynamicStatusBarTheme(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header
          const SliverToBoxAdapter(child: HomeHeader()),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          // Promo Slider
          const SliverToBoxAdapter(
            child: PromoSlider(),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          // Product Categories
          const SliverToBoxAdapter(
            child: Center(child: HomeProductCategories()),
          ),

          const SliverToBoxAdapter(
              child: SizedBox(height: GSizes.spaceBtwSections / 2)),

          SliverToBoxAdapter(
            child: Obx(() => productsController.popularProductsLoading.value
                ? const SizedBox()
                : const HomePopularProductsSection()),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),
        ],
      ),
    );
  }
}
