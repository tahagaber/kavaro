import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constats/app_colors.dart';
import '../../../managers/cart_manager.dart';
import '../../../models/cart_item.dart';
import 'widgets/checkout_order_summary.dart';
import 'widgets/checkout_shipping_info.dart';
import 'widgets/checkout_payment_section.dart';
import 'widgets/checkout_price_summary.dart';
import 'widgets/checkout_purchase_button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cart = CartManager();
    final items = cart.items.value;
    final subtotal = cart.subtotal;
    const shipping = 12.50;
    final tax = subtotal * 0.02; // 8% tax
    final total = subtotal + shipping + tax;

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Complete Order',
          style: GoogleFonts.spaceGrotesk(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckoutOrderSummary(items: items),
            const SizedBox(height: 32),
            CheckoutShippingInfo(
              firstNameController: _firstNameController,
              lastNameController: _lastNameController,
              addressController: _addressController,
              phoneController: _phoneController,
            ),
            const SizedBox(height: 32),
            const CheckoutPaymentSection(),
            const SizedBox(height: 32),
            CheckoutPriceSummary(
              subtotal: subtotal,
              shipping: shipping,
              tax: tax,
              total: total,
            ),
            const SizedBox(height: 32),
            CheckoutPurchaseButton(
              onPressed: () => _handlePurchase(context),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }



  void _handlePurchase(BuildContext context) {
    // Show success dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Icon(Icons.check_circle, color: Colors.green, size: 64),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Purchase Successful!',
              style: GoogleFonts.spaceGrotesk(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your digital assets have been added to your inventory.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                CartManager().clearCart();
                Navigator.of(context).pushNamedAndRemoveUntil('/market', (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: const Text(
                'Back to Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
