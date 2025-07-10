// 장바구니 상태 관리

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get items => List.unmodifiable(_cartItems);

  void add(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void remove(String id) {
    _cartItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void update(Product updated) {
    final index = _cartItems.indexWhere((p) => p.id == updated.id);
    if (index != -1) {
      _cartItems[index] = updated;
      notifyListeners();
    }
  }

  void clear() {
    _cartItems.clear();
    notifyListeners();
  }

  Product? getById(String id) =>
      _cartItems.firstWhereOrNull((item) => item.id == id);

}
