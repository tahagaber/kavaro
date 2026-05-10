import 'package:flutter/material.dart';
import '../../../../../constats/app_colors.dart';
import '../../../../widgets/gradient_button.dart';

class GlowingGradientButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const GlowingGradientButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
        ),
        GradientButton(
          text: text,
          icon: icon,
          onTap: onTap,
        ),
      ],
    );
  }
}
