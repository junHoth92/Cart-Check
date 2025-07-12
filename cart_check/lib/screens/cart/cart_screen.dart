import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items;

    return Scaffold(
      appBar: AppBar(title: const Text('장바구니')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final product = items[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.category ?? ''),
            trailing: IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {

              },
            ),
            onTap: () {
              // 상세 편집 or WebView로 이동
            },
          );
        },
      ),
    );
  }
}
