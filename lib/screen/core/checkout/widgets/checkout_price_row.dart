import 'package:flutter/material.dart';
import '../../../../constats/app_colors.dart';

class CheckoutPriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const CheckoutPriceRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? Colors.white : Colors.white60,
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isTotal ? AppColors.primary : Colors.white,
            fontSize: isTotal ? 22 : 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
