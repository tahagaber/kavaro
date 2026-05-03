import 'package:flutter/material.dart';
import '../../../../constats/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.secondary, width: 2),
              ),
            ),
            const CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.backgroundDark,
              backgroundImage: AssetImage('assets/images/kavaro.png'),
            ),
            const Positioned(bottom: 0, right: 0, child: ProBadge(text: "PRO")),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          "KaVaro",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Digital Artist & 3D Designer",
          style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),
      ],
    );
  }
}

class ProBadge extends StatelessWidget {
  final String text;

  const ProBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
