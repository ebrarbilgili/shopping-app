import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/product.dart';
import 'package:shopping_app/core/provider/user_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.imageUrl),
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('${product.price} ₺')],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CupertinoButton(
              child: Icon(Icons.add),
              onPressed: () {
                context.read<User>().addItemsToBasket(product);
              },
            ),
            Text('${context.watch<User>().basketProducts[product] ?? 0}'),
            CupertinoButton(
              child: Icon(Icons.remove),
              onPressed: () {
                context.read<User>().removeItemsFromBasket(product);
              },
            ),
            CupertinoButton(
              child: Icon(Icons.add_shopping_cart),
              onPressed: () {
                context.read<User>().addFirstItemToBasket(product);
              },
            )
          ],
        ),
      ),
    );
  }
}

class ShoppingCartCard extends StatelessWidget {
  final Product product;
  final Widget subtitle;

  const ShoppingCartCard({Key key, this.product, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.imageUrl),
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [subtitle],
        ),
      ),
    );
  }
}
