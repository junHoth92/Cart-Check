import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../providers/purchased_provider.dart';

class PurchasedScreen extends StatelessWidget {
  const PurchasedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final purchasedProvider = Provider.of<PurchasedProvider>(context);
    final purchasedItems = purchasedProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('구매 내역'),
      ),
      body: purchasedItems.isEmpty
          ? const Center(child: Text('구매한 항목이 없습니다.'))
          : ListView.builder(
        itemCount: purchasedItems.length,
        itemBuilder: (context, index) {
          final product = purchasedItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(product.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.price != null)
                    Text('가격: ${_formatPrice(product.price!)}'),
                  if (product.purchasedAt != null)
                    Text('구매일: ${_formatDate(product.purchasedAt!)}'),
                  if (product.link != null && product.link!.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        // WebView 화면으로 이동 (GoRouter 기준)
                        context.pushNamed('webview', queryParameters: {
                          'url': product.link!,
                        });
                      },
                      child: const Text(
                        '상품 링크 열기',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  purchasedProvider.remove(product.id);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatPrice(int price) {
    // 숫자 포맷팅 (₩12,000)
    return '₩${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}';
  }

  String _formatDate(DateTime date) {
    // 날짜 포맷 (yyyy.MM.dd)
    return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
  }
}
