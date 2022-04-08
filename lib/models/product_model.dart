import 'package:flutter/material.dart';

class DataStore extends ChangeNotifier {
  int _price = 0;

  int get price => _price;

  void add() {
    _price = price + 10;
    notifyListeners();
  }

  void substract() {
    _price = price - 10;
    notifyListeners();
  }
}

class CartStore extends ChangeNotifier {
  final List<ProductInfo> _cartData = [];

  List<ProductInfo> get cartData => _cartData;

  double? get total {
    double totalPrice = 0;
    //totalPrice = totalPrice + cartData[]
    for (int i = 0; i < cartData.length; i++) {
      totalPrice = totalPrice + cartData[i].price!;
    }
    return totalPrice;
  }

  void addToCart(ProductInfo product) {
    _cartData.add(product);
    notifyListeners();
  }
}

class ProductInfo {
  int? id;
  String? name;
  String? details;
  int? price;
  String? imageUrl;

  ProductInfo({
    required this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.imageUrl,
  });
}
