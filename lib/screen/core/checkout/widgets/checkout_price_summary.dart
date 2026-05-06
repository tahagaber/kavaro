import 'package:flutter/material.dart';
import 'checkout_price_row.dart';

class CheckoutPriceSummary extends StatelessWidget {
  final double subtotal;
  final double shipping;
  final double tax;
  final double total;

  const CheckoutPriceSummary({
    super.key,
    required this.subtotal,
    required this.shipping,
    required this.tax,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          CheckoutPriceRow(
            label: 'Subtotal',
            value: '${subtotal.toStringAsFixed(2)} EG',
          ),
          const SizedBox(height: 12),
          CheckoutPriceRow(
            label: 'Shipping',
            value: '${shipping.toStringAsFixed(2)} EG',
          ),
          const SizedBox(height: 12),
          CheckoutPriceRow(
            label: 'Estimated Tax',
            value: '${tax.toStringAsFixed(2)} EG',
          ),
          const Divider(color: Colors.white10, height: 32),
          CheckoutPriceRow(
            label: 'Total',
            value: '${total.toStringAsFixed(2)} EG',
            isTotal: true,
          ),
        ],
      ),
    );
  }
}
