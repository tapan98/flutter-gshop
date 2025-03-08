import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/common/widgets/texts/brand_title_text.dart';
import 'package:gshop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:gshop/features/shop/controllers/brands_controller.dart';
import 'package:gshop/features/shop/models/brand_model.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/logger/logger.dart';

class ProductDetailsBrandName extends StatefulWidget {
  const ProductDetailsBrandName({super.key, required this.brandId});

  final String brandId;

  @override
  State<ProductDetailsBrandName> createState() =>
      _ProductDetailsBrandNameState();
}

class _ProductDetailsBrandNameState extends State<ProductDetailsBrandName> {
  final _controller = BrandsController.instance;
  late Future<BrandModel?> _brand;

  @override
  void initState() {
    _brand = _controller.fetchBrandById(widget.brandId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _brand,
      builder: (_, snapshot) {
        if (ConnectionState.waiting == snapshot.connectionState) {
          return _buildShimmerLoadingWidget();
        }
        else if (snapshot.hasData && snapshot.data != null) {
          return _buildBrandTitle(snapshot.data!);
        }
        else if (snapshot.hasError) {
          Log.error(snapshot.error);
          return _buildWidgetOnError();
        } else {
          return _buildWidgetOnError();
        }
      },
    );
  }

  Widget _buildBrandTitle(BrandModel brand) {
    return brand.isVerified
        ? BrandTitleTextWithVerifiedIcon(title: brand.brandName)
        : BrandTitleText(brandTitle: brand.brandName);
  }

  Widget _buildWidgetOnError() {
    return const Text(
      GTexts.couldNotLoadBrandName,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildShimmerLoadingWidget() {
    return const ShimmerWidget(height: 10, width: 30);
  }
}
