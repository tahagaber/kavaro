import 'package:flutter/material.dart';
import 'package:kavaro/widgets/auth_brand_section.dart';
import 'package:kavaro/screen/auth/OTB/widgets/otp_inputs.dart';
import '../forget_password/widgets/auth_background.dart';
import '../forget_password/widgets/auth_header.dart';
import '../forget_password/widgets/glowing_gradient_button.dart';

class OtbScreen extends StatefulWidget {
  const OtbScreen({super.key});

  @override
  State<OtbScreen> createState() => _OtbScreenState();
}

class _OtbScreenState extends State<OtbScreen> {
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
                  title: 'VERIFY YOUR EMAIL',
                  subtitle: "We've sent a 4-digit code to your email.",
                ),

                const SizedBox(height: 40),

                // OTP Inputs
                const OtpInputs(),

                const SizedBox(height: 50),

                // Submit Button
                GlowingGradientButton(
                  text: 'Verify & Continue',
                  icon: Icons.arrow_forward,
                  onTap: () {
                    // Get destination from arguments if available, else default to /resetPassword
                    final args = ModalRoute.of(context)?.settings.arguments as String?;
                    final destination = args ?? '/resetPassword';
                    Navigator.pushReplacementNamed(context, destination);
                  },
                ),

                const SizedBox(height: 40),

                // Resend text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't receive code? ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle resend
                      },
                      child: const Text(
                        "Resend Code",
                        style: TextStyle(
                          color: Color(0xFFc026d3),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Timer
                const Text(
                  "00:59",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),

                const SizedBox(height: 50),

                // Back to Login
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back, color: Colors.grey, size: 16),
                      SizedBox(width: 8),
                      Text(
                        "Back to Login",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
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
