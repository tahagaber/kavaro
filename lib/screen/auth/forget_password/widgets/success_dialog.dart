import 'package:flutter/material.dart';
import '../../../../../constats/app_colors.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  const SuccessDialog({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF1a0a2e),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Icon(Icons.check_circle, color: Color(0xFF00d4aa), size: 60),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  static void show(BuildContext context, {
    required String title,
    required String message,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
        title: title,
        message: message,
        buttonText: buttonText,
        onPressed: onPressed,
      ),
    );
  }
}
