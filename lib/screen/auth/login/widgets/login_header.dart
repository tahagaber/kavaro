import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const Text(
          'KAVARO',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFFf5e6c8),
            letterSpacing: 3,
          ),
        ),
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
        const Text(
          'ELEVATE YOUR REALITY',
          style: TextStyle(fontSize: 10, color: Colors.grey, letterSpacing: 2),
        ),
      ],
    );
  }
}
