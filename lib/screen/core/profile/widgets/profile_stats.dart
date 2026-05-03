import 'package:flutter/material.dart';
import '../../../../constats/app_colors.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF140E24),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          StatItem(val: "124", label: "PROJECTS"),
          StatDivider(),
          StatItem(val: "18k", label: "FOLLOWERS"),
          StatDivider(),
          StatItem(val: "842", label: "SALES"),
        ],
      ),
    );
  }
}

class StatDivider extends StatelessWidget {
  const StatDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 1,
      color: Colors.white.withOpacity(0.1),
    );
  }
}

class StatItem extends StatelessWidget {
  final String val;
  final String label;

  const StatItem({
    super.key,
    required this.val,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          val,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 9,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
