import 'package:flutter/material.dart';

class AuthBrandSection extends StatelessWidget {
  final String tagline;
  const AuthBrandSection({super.key, required this.tagline});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFc9a86c),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.eco, color: Colors.white, size: 35),
        ),

        const SizedBox(height: 15),

        // Brand Name
        const Text(
          'KAVARO',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFFf5e6c8),
            letterSpacing: 3,
          ),
        ),

        // Decorative line
        Container(
          width: 140,
          height: 2,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.transparent,
                Color(0xFF00d4aa),
                Colors.transparent,
              ],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        const SizedBox(height: 10),

        // Tagline
        Text(
          tagline.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
