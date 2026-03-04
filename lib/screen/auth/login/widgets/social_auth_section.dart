import 'package:flutter/material.dart';
import 'package:kavaro/widgets/social_button.dart';

class SocialAuthSection extends StatelessWidget {
  final VoidCallback onAppleTap;
  final VoidCallback onGoogleTap;

  const SocialAuthSection({
    super.key,
    required this.onAppleTap,
    required this.onGoogleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(height: 1, color: Colors.grey.withOpacity(0.3)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'OR CONTINUE WITH',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  letterSpacing: 1,
                ),
              ),
            ),
            Expanded(
              child: Container(height: 1, color: Colors.grey.withOpacity(0.3)),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(
              icon: Icons.apple,
              color: Colors.white,
              onTap: onAppleTap,
            ),
            const SizedBox(width: 20),
            SocialButton(
              icon: Icons.g_mobiledata,
              color: Colors.red,
              onTap: onGoogleTap,
            ),
          ],
        ),
      ],
    );
  }
}
