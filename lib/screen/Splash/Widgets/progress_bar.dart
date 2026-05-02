import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constats/app_colors.dart';

class ProgressBar extends StatelessWidget {
  final double progress;

  const ProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white.withOpacity(0.05),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
              minHeight: 2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'INITIALIZING AI CORE...',
            style: GoogleFonts.outfit(
              fontSize: 8,
              color: AppColors.secondary.withOpacity(0.6),
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
