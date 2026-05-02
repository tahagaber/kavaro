import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constats/app_colors.dart';

class BrandingText extends StatelessWidget {
  const BrandingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'KAVARO',
          style: GoogleFonts.outfit(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 8,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 180,
          height: 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                AppColors.secondary,
                AppColors.primary,
                Colors.transparent,
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'ELEVATE YOUR REALITY',
          style: GoogleFonts.outfit(
            fontSize: 12,
            color: Colors.white.withOpacity(0.4),
            letterSpacing: 4,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
