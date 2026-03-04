import 'package:flutter/material.dart';

class OnboardingHud extends StatelessWidget {
  final int currentIndex;

  const OnboardingHud({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top Left
        Positioned(
          top: 60,
          left: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHudLine('Scanning Mesh: Active'),
              const SizedBox(height: 8),
              _buildHudLine('Latent Space: Ready'),
            ],
          ),
        ),

        // Top Right
        Positioned(
          top: 60,
          right: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'KAVARO OS v1.0.4',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 10,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'STEP 0${currentIndex + 1}_INIT',
                style: TextStyle(
                  color: const Color(0xFF7F0DF2).withOpacity(0.8),
                  fontSize: 10,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHudLine(String text) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: Color(0xFF7F0DF2),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF7F0DF2),
            fontSize: 10,
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }
}
