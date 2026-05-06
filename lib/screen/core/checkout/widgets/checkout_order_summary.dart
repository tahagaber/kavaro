import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constats/app_colors.dart';
import '../../../../models/cart_item.dart';
import 'checkout_order_item.dart';

class CheckoutOrderSummary extends StatelessWidget {
  final List<CartItem> items;

  const CheckoutOrderSummary({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Order Summary Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ORDER SUMMARY',
              style: GoogleFonts.spaceGrotesk(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 1.2,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${items.length} ITEMS',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Order Items List
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.03),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.white10, height: 24),
            itemBuilder: (context, index) {
              return CheckoutOrderItem(item: items[index]);
            },
          ),
        ),
      ],
    );
  }
}
