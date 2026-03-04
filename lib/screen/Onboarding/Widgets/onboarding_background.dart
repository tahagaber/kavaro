import 'package:flutter/material.dart';

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Gradient Orbs
        Positioned(
          top: -100,
          left: -50,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF7F0DF2).withOpacity(0.15),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7F0DF2).withOpacity(0.15),
                  blurRadius: 120,
                  spreadRadius: 60,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          right: -100,
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF7F0DF2).withOpacity(0.15),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7F0DF2).withOpacity(0.15),
                  blurRadius: 150,
                  spreadRadius: 60,
                ),
              ],
            ),
          ),
        ),

        // Particle overlay (Dots)
        Positioned.fill(
          child: Opacity(
            opacity: 0.6,
            child: CustomPaint(painter: ParticleOverlayPainter()),
          ),
        ),
      ],
    );
  }
}

class ParticleOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF7F0DF2).withOpacity(0.2)
      ..style = PaintingStyle.fill;

    const spacing = 30.0;
    for (double i = 0; i < size.width; i += spacing) {
      for (double j = 0; j < size.height; j += spacing) {
        canvas.drawCircle(Offset(i, j), 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
