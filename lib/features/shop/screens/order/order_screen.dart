import 'package:flutter/material.dart';
import 'package:gshop/features/shop/screens/order/widgets/order_appbar_widget.dart';
import 'package:gshop/features/shop/screens/order/widgets/order_item_widget.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Order search and Filter
          const OrderAppbarWidget(),

          OrderItemWidget(
            imageUrl: GImages.product1,
            deliveryText: "Delivered on Feb 15, 2025",
            product: "Samsung Galaxy S24 Ultra",
            isNetworkImage: false,
            onTap: () {},
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwItemsHeight()),

          OrderItemWidget(
            imageUrl: GImages.product1,
            deliveryText: "Delivered on Feb 17, 2025",
            product: "Samsung Galaxy S24 Ultra",
            isNetworkImage: false,
            shouldRate: false,
            onTap: () {},
          ),

          OrderItemWidget(
            imageUrl: GImages.product1,
            deliveryText: "Delivered on Feb 15, 2025",
            product: "Samsung Galaxy S24 Ultra",
            isNetworkImage: false,
            onTap: () {},
          ),
          OrderItemWidget(
            imageUrl: GImages.product1,
            deliveryText: "Delivered on Feb 15, 2025",
            product: "Samsung Galaxy S24 Ultra",
            isNetworkImage: false,
            onTap: () {},
          ),
          OrderItemWidget(
            imageUrl: GImages.product1,
            deliveryText: "Delivered on Feb 15, 2025",
            product: "Samsung Galaxy S24 Ultra",
            isNetworkImage: false,
            onTap: () {},
          ),
          OrderItemWidget(
            imageUrl: GImages.product1,
            deliveryText: "Delivered on Feb 15, 2025",
            product: "Samsung Galaxy S24 Ultra",
            isNetworkImage: false,
            onTap: () {},
          ),
          OrderItemWidget(
            imageUrl: GImages.product1,
            deliveryText: "Delivered on Feb 15, 2025",
            product: "Samsung Galaxy S24 Ultra",
            isNetworkImage: false,
            onTap: () {},
          ),
          OrderItemWidget(
            imageUrl: GImages.product1,
            deliveryText: "Delivered on Feb 15, 2025",
            product: "Samsung Galaxy S24 Ultra",
            isNetworkImage: false,
            onTap: () {},
          ),

        ],
      ),
    );
  }
}
