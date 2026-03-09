import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';

class CartManager {
  // Singleton pattern
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  // Observable list of cart items
  final ValueNotifier<List<CartItem>> items = ValueNotifier<List<CartItem>>([]);

  void addToCart(Map<String, dynamic> product, int quantity) {
    final existingIndex = items.value.indexWhere(
      (item) => item.name == product['name'],
    );

    if (existingIndex >= 0) {
      // Item already in cart, update quantity
      items.value[existingIndex].quantity += quantity;
      // Trigger update manually since List reference doesn't change
      items.value = List.from(items.value);
    } else {
      // New item
      final newItem = CartItem(
        id: DateTime.now().toString(),
        name: product['name'],
        price: product['price'],
        image: product['image'],
        quantity: quantity,
      );
      items.value = [...items.value, newItem];
    }
  }

  void removeFromCart(String name) {
    items.value = items.value.where((item) => item.name != name).toList();
  }

  void updateQuantity(String name, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(name);
      return;
    }
    final index = items.value.indexWhere((item) => item.name == name);
    if (index >= 0) {
      items.value[index].quantity = newQuantity;
      items.value = List.from(items.value);
    }
  }

  void clearCart() {
    items.value = [];
  }

  double get subtotal {
    return items.value.fold(0, (sum, item) => sum + item.total);
  }

  int get itemCount {
    return items.value.fold(0, (sum, item) => sum + item.quantity);
  }
}
