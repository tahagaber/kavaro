import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constats/app_colors.dart';
import 'checkout_text_field.dart';

class CheckoutShippingInfo extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController addressController;
  final TextEditingController phoneController;

  const CheckoutShippingInfo({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.addressController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SHIPPING INFORMATION',
          style: GoogleFonts.spaceGrotesk(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CheckoutTextField(
                label: 'FIRST NAME',
                controller: firstNameController,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CheckoutTextField(
                label: 'LAST NAME',
                controller: lastNameController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        CheckoutTextField(
          label: 'STREET ADDRESS',
          controller: addressController,
        ),
        const SizedBox(height: 16),
        CheckoutTextField(
          label: 'PHONE NUMBER',
          controller: phoneController,
        ),
      ],
    );
  }
}
