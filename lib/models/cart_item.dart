class CartItem {
  final String id;
  final String name;
  final dynamic price; // Can be String (like "Free") or double
  final String image;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  double get priceValue {
    if (price is double) return price;
    if (price is String) {
      String priceStr = price.toString().toUpperCase();
      if (priceStr.contains('EG')) {
        return double.tryParse(priceStr.replaceAll('EG', '').trim()) ?? 0.0;
      }
      if (priceStr.contains(r'$')) {
        return double.tryParse(priceStr.replaceAll(r'$', '').trim()) ?? 0.0;
      }
      if (priceStr.toLowerCase() == 'free') return 0.0;
      return double.tryParse(priceStr) ?? 0.0;
    }
    return 0.0;
  }

  String get formattedPrice {
    if (priceValue == 0) return 'Free';
    return '${priceValue.toStringAsFixed(2)} EG';
  }

  double get total {
    return priceValue * quantity;
  }
}
