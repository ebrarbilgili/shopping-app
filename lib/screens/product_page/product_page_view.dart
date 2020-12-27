import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/components/components.dart';
import 'package:shopping_app/components/list_products.dart';
import 'package:shopping_app/core/product.dart';
// import 'package:shopping_app/screens/create_product/create_product.dart';
import 'package:shopping_app/screens/shopping_cart/shopping_cart.dart';
import 'package:shopping_app/widget/appbar.dart';
import 'package:shopping_app/widget/card.dart';
import './product_page_view_model.dart';

class ProductPageView extends ProductPageViewModel {
  @override
  Widget build(BuildContext context) {
    return buildScaffold;
  }

  Scaffold get buildScaffold => Scaffold(
        backgroundColor: white,
        appBar: buildNavigationBar,
        body: buildBody,
        // floatingActionButton: buildFloatingActionButton,
      );

  FloatingActionButton get buildFloatingActionButton => FloatingActionButton(
        backgroundColor: black,
        child: Icon(Icons.add),
        onPressed: () {
          // routeTo(context, CreateProduct());
        },
      );

  ListView get buildBody => ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: Product(
              name: products[index].name,
              imageUrl: products[index].imageUrl,
              price: products[index].price,
            ),
          );
        },
      );

  CupertinoNavigationBar get buildNavigationBar => navigationBar(
        'Products',
        CupertinoButton(
            child: Icon(Icons.shopping_cart),
            onPressed: () {
              routeTo(context, ShoppingCart());
            }),
      );
}
