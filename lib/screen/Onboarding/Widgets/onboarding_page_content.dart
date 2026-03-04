import 'package:flutter/material.dart';
import 'package:kavaro/screen/Onboarding/Widgets/onboarding_data.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPageContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -80), // Move the entire image/circles up
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Concentric circles center
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF7F0DF2).withOpacity(0.3),
                width: 2,
              ),
            ),
          ),
          Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF7F0DF2).withOpacity(0.1),
                width: 1,
              ),
            ),
          ),

          // Center Image with Glow
          Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7F0DF2).withOpacity(0.4),
                  blurRadius: 50,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Image.asset(
              data.imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF0D0B14),
                    border: Border.all(
                      color: const Color(0xFF7F0DF2).withOpacity(0.5),
                    ),
                  ),
                  child: const Icon(
                    Icons.view_in_ar_rounded,
                    color: Color(0xFF7F0DF2),
                    size: 80,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
