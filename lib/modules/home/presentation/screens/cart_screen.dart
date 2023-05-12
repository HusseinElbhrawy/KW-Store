import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../widgets/cart_body_widget.dart';
import '../widgets/checkout_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CheckoutWidget(),
      appBar: AppBar(
        title: const BigTextWidget(
          AppStrings.cart,
          fontWeight: AppFontsWeight.bold,
        ),
      ),
      body: const CartBodyWidget(),
    );
  }
}
