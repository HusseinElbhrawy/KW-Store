import 'package:flutter/material.dart';

import '../../domain/entities/home.dart';
import '../widgets/product_over_view_app_bar.dart';
import '../widgets/product_over_view_info_widget.dart';
import '../widgets/product_overview_bottom_nav_widget.dart';

class ProductsOverview extends StatefulWidget {
  const ProductsOverview({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);
  final Product product;
  final int index;

  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: ProductOverviewBottomNavWidget(
        products: widget.product,
        index: widget.index,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ProductOverViewAppBar(
              product: widget.product,
              index: widget.index,
              pageController: _pageController,
            ),
            ProductOverViewInfoWidget(
              pageController: _pageController,
              products: widget.product,
            ),
          ],
        ),
      ),
    );
  }
}
