import 'package:flutter/material.dart';
import '../../../../constats/app_colors.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: ProfileButton(
            label: "Edit Profile",
            icon: Icons.edit_note,
            primary: true,
          ),
        ),
        SizedBox(width: 12),
        ProfileButton(
          label: "",
          icon: Icons.share,
          primary: false,
          width: 60,
        ),
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool primary;
  final double? width;

  const ProfileButton({
    super.key,
    required this.label,
    required this.icon,
    required this.primary,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: width,
      decoration: BoxDecoration(
        gradient: primary ? AppColors.primaryGradient : null,
        color: primary ? null : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: primary
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ]
            : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          if (label.isNotEmpty) ...[
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
