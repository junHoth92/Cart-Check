// 구매 목록 상태 관리

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class PurchasedProvider extends ChangeNotifier {
  final List<Product> _purchasedItems = [];

  List<Product> get items => List.unmodifiable(_purchasedItems);

  void add(Product product) {
    _purchasedItems.add(
      product.copyWith(
        status: ProductStatus.purchased,
        purchasedAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void remove(String id) {
    _purchasedItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void clear() {
    _purchasedItems.clear();
    notifyListeners();
  }

  Product? getById(String id) =>
      _purchasedItems.firstWhereOrNull((item) => item.id == id);
}
