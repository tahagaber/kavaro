import 'package:flutter/material.dart';
import '../../../../models/cart_item.dart';

class CheckoutOrderItem extends StatelessWidget {
  final CartItem item;

  const CheckoutOrderItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 70,
            height: 70,
            child: item.image.startsWith('http')
                ? Image.network(item.image, fit: BoxFit.cover)
                : Image.asset(item.image, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Qty: ${item.quantity}',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Text(
          '${(item.priceValue * item.quantity).toStringAsFixed(2)} EG',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
