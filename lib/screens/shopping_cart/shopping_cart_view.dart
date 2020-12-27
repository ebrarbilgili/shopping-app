import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/product.dart';
import 'package:shopping_app/core/provider/user_provider.dart';
import 'package:shopping_app/widget/appbar.dart';
import 'package:shopping_app/widget/card.dart';
import './shopping_cart_view_model.dart';

class ShoppingCartView extends ShoppingCartViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: navigationBar('Shopping Card', null),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: context.watch<User>().basketItems.length,
              itemBuilder: (context, index) {
                final product = context.watch<User>().basketItems[index];
                return ShoppingCartCard(
                  product: Product(
                      name: product.name,
                      imageUrl: product.imageUrl,
                      price: product.price),
                  subtitle: Text(
                      'total: ${context.watch<User>().basketProducts[product] * product.price} ₺'),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('TOTAL PRICE: ${context.watch<User>().totalPrice} ₺'),
            ],
          ),
        ],
      ),
    );
  }
}
