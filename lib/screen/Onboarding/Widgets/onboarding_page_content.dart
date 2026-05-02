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
            width: 370,
            height: 370,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF7F0DF2).withOpacity(0.2),
                width: 1.5,
              ),
            ),
          ),
          Container(
            width: 430,
            height: 430,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF7F0DF2).withOpacity(0.05),
                width: 1,
              ),
            ),
          ),

          // Center Image with Glow
          Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF7F0DF2).withOpacity(0.5),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7F0DF2).withOpacity(0.4),
                  blurRadius: 60,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                data.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF0D0B14),
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
          ),
        ],
      ),
    );
  }
}
