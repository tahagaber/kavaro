import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFc9a86c).withOpacity(0.2),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFc9a86c).withOpacity(0.3),
            blurRadius: 40,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFc9a86c),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(
          Icons.eco_rounded,
          color: Colors.white,
          size: 55,
        ),
      ),
    );
  }
}
