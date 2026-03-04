import 'package:flutter/material.dart';

class SignupPrompt extends StatelessWidget {
  final VoidCallback onSignupTap;

  const SignupPrompt({super.key, required this.onSignupTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: onSignupTap,
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xFFc026d3),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
