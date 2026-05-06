import 'package:flutter/material.dart';
import '../../../../constats/app_colors.dart';

class CheckoutPurchaseButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CheckoutPurchaseButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: const Size(double.infinity, 64),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 8,
            shadowColor: AppColors.primary.withOpacity(0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.lock_outline, color: Colors.white, size: 24),
              SizedBox(width: 12),
              Text(
                'COMPLETE PURCHASE',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'ENCRYPTED SECURE CHECKOUT',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 10,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
