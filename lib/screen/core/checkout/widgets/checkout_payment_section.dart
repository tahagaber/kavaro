import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constats/app_colors.dart';
import 'premium_glass_card.dart';
import 'checkout_payment_option.dart';

class CheckoutPaymentSection extends StatelessWidget {
  const CheckoutPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PAYMENT METHOD',
          style: GoogleFonts.spaceGrotesk(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),

        // Premium Glass Card UI
        const PremiumGlassCard(),
        const SizedBox(height: 16),

        // Other Payment Options
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2.5,
          children: const [
            CheckoutPaymentOption(
              icon: Icons.cloud_queue,
              label: 'Paypal',
              iconColor: Colors.blue,
            ),
            CheckoutPaymentOption(
              icon: Icons.apple,
              label: 'Pay',
              iconColor: Colors.white,
            ),
            CheckoutPaymentOption(
              icon: Icons.bolt,
              label: 'InstaPay',
              iconColor: Colors.purpleAccent,
            ),
            CheckoutPaymentOption(
              icon: Icons.vignette,
              label: 'V-Cash',
              iconColor: Colors.redAccent,
            ),
          ],
        ),
      ],
    );
  }
}
