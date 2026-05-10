import 'package:flutter/material.dart';
import 'package:kavaro/widgets/auth_brand_section.dart';
import '../../../constats/app_colors.dart';
import 'widgets/auth_background.dart';
import 'widgets/auth_header.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/glowing_gradient_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 60),

                const AuthBrandSection(tagline: 'ELEVATE YOUR REALITY'),

                const SizedBox(height: 50),

                const AuthHeader(
                  title: 'FORGOT PASSWORD?',
                  subtitle: "Don't worry! Enter your email address to receive a verification code.",
                ),

                const SizedBox(height: 48),

                // Email Input
                AuthTextField(
                  controller: _emailController,
                  hint: 'Email Address',
                  prefixIcon: Icons.email_outlined,
                ),

                const SizedBox(height: 48),

                // Submit Button
                GlowingGradientButton(
                  text: 'Send Verification Code',
                  icon: Icons.send_rounded,
                  onTap: () {
                    // Navigate to OTP Screen
                    Navigator.pushNamed(context, '/otb', arguments: '/resetPassword');
                  },
                ),

                const SizedBox(height: 40),

                // Back to Login
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back, color: AppColors.textSecondary, size: 16),
                      SizedBox(width: 8),
                      Text(
                        "Back to Login",
                        style: TextStyle(color: AppColors.textSecondary, fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
