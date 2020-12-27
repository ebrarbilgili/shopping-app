import 'package:flutter/material.dart';
import 'package:shopping_app/core/product.dart';

class User extends ChangeNotifier {
  Map<Product, int> basketProducts = {};

  List<Product> get basketItems => basketProducts.keys.toList();

  double get totalPrice {
    if (basketProducts.isEmpty) {
      return 0;
    } else {
      double _total = 0;
      basketProducts.forEach((key, value) {
        _total += key.price * value;
      });
      return _total;
    }
  }

  void addFirstItemToBasket(Product product) {
    basketProducts[product] = 1;
    notifyListeners();
  }

  void addItemsToBasket(Product product) {
    if (basketProducts[product] == null)
      addFirstItemToBasket(product);
    else
      basketProducts[product]++;

    notifyListeners();
  }

  void removeItemsFromBasket(Product product) {
    if (basketProducts[product] == null) return;

    if (basketProducts[product] == 0)
      basketProducts.removeWhere((key, value) => key == product);
    else
      basketProducts[product]--;

    notifyListeners();
  }

  void removeAllItemFromBasket(Product product) {
    basketProducts[product] = null;

    notifyListeners();
  }
}
