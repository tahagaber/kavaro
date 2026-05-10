import 'package:flutter/material.dart';
import 'package:kavaro/widgets/auth_brand_section.dart';
import 'widgets/auth_background.dart';
import 'widgets/auth_header.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/glowing_gradient_button.dart';
import 'widgets/success_dialog.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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

                const AuthBrandSection(tagline: 'SECURE YOUR ACCOUNT'),

                const SizedBox(height: 50),

                const AuthHeader(
                  title: 'CREATE NEW PASSWORD',
                  subtitle: "Your new password must be different from previous used passwords.",
                ),

                const SizedBox(height: 48),

                // New Password Field
                AuthTextField(
                  controller: _passwordController,
                  hint: 'New Password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.white.withOpacity(0.3), size: 18),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),

                const SizedBox(height: 20),

                // Confirm Password Field
                AuthTextField(
                  controller: _confirmPasswordController,
                  hint: 'Confirm Password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: _obscureConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.white.withOpacity(0.3), size: 18),
                    onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                  ),
                ),

                const SizedBox(height: 48),

                // Submit Button
                GlowingGradientButton(
                  text: 'Reset Password',
                  icon: Icons.check_circle_outline,
                  onTap: () {
                    // Show Success and Navigate to Login
                    SuccessDialog.show(
                      context,
                      title: "Success!",
                      message: "Your password has been reset successfully.",
                      buttonText: "Back to Login",
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                      },
                    );
                  },
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
