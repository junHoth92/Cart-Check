// 장바구니 항목

enum ProductStatus {
  cart,      // 장바구니에 있는 상태 (구매 전)
  purchased  // 구매 완료 상태
}

class Product {
  final String id; // 상품 고유 ID (UUID 또는 Firestore ID 등)
  final String name; // 상품명
  final String? link; // 인터넷 쇼핑몰 상품 링크 (nullable)
  final int? price; // 상품 가격 (원화 기준, 소수점 없는 정수)
  final String? category; // 카테고리 또는 장소 태그 (nullable)
  final DateTime? createdAt; // 상품을 장바구니에 추가한 시각
  final DateTime? purchasedAt; // 상품을 구매한 시각 (purchased 상태일 때만 사용)
  final ProductStatus status; // 현재 상품 상태 (장바구니 or 구매 완료)
  final bool notificationEnabled; // 알림 활성화 여부 (구매 알림 등)
  final bool urgent; // 긴급 구매 여부 (사용자 설정, true일 경우 우선순위 높게 표시)

  Product({
    required this.id,
    required this.name,
    this.link,
    this.price,
    this.category,
    this.createdAt,
    this.purchasedAt,
    this.status = ProductStatus.cart,
    this.notificationEnabled = false,
    this.urgent = false,
  });

  // 복사본 생성 메서드 (변경된 필드만 업데이트)
  Product copyWith({
    String? id,
    String? name,
    String? link,
    int? price,
    String? category,
    DateTime? createdAt,
    DateTime? purchasedAt,
    ProductStatus? status,
    bool? notificationEnabled,
    bool? urgent,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      price: price ?? this.price,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      purchasedAt: purchasedAt ?? this.purchasedAt,
      status: status ?? this.status,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      urgent: urgent ?? this.urgent,
    );
  }

  // JSON → 객체
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      link: json['link'],
      price: json['price'],
      category: json['category'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      purchasedAt: DateTime.tryParse(json['purchasedAt'] ?? ''),
      status: json['status'] == 'purchased'
          ? ProductStatus.purchased
          : ProductStatus.cart,
      notificationEnabled: json['notificationEnabled'] ?? false,
      urgent: json['urgent'] ?? false,
    );
  }

  // 객체 → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'link': link,
      'price': price,
      'category': category,
      'createdAt': createdAt?.toIso8601String(),
      'purchasedAt': purchasedAt?.toIso8601String(),
      'status': status.name,
      'notificationEnabled': notificationEnabled,
      'urgent': urgent,
    };
  }
}
