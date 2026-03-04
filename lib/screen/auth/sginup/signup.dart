import 'package:flutter/material.dart';
import 'package:kavaro/widgets/auth_brand_section.dart';
import 'package:kavaro/widgets/auth_text_field.dart';
import 'package:kavaro/widgets/gradient_button.dart';
import 'package:kavaro/widgets/social_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1a0a2e), Color(0xFF0d0d0d)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  const AuthBrandSection(tagline: 'START YOUR JOURNEY'),

                  const SizedBox(height: 35),

                  // Full Name Field
                  const AuthTextField(
                    label: 'FULL NAME',
                    hintText: 'John Doe',
                    icon: Icons.person_outline,
                  ),

                  const SizedBox(height: 20),

                  // Email Field
                  const AuthTextField(
                    label: 'EMAIL ADDRESS',
                    hintText: 'name@example.com',
                    icon: Icons.email_outlined,
                  ),

                  const SizedBox(height: 20),

                  // Phone Number Field
                  const AuthTextField(
                    label: 'PHONE NUMBER',
                    hintText: '+1 234 567 890',
                    icon: Icons.phone_android_outlined,
                  ),

                  const SizedBox(height: 20),

                  // Password Field
                  AuthTextField(
                    label: 'PASSWORD',
                    hintText: '••••••••',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    obscureText: _obscurePassword,
                    toggleVisibility: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // Confirm Password Field
                  AuthTextField(
                    label: 'CONFIRM PASSWORD',
                    hintText: '••••••••',
                    icon: Icons.lock_clock_outlined,
                    isPassword: true,
                    obscureText: _obscureConfirmPassword,
                    toggleVisibility: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),

                  const SizedBox(height: 35),

                  // Sign Up Button
                  GradientButton(
                    text: 'Create Account',
                    icon: Icons.arrow_forward,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/otb');
                    },
                  ),

                  const SizedBox(height: 25),

                  // Divider
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'OR SIGN UP WITH',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Social Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        icon: Icons.apple,
                        color: Colors.white,
                        onTap: () {},
                      ),
                      const SizedBox(width: 20),
                      SocialButton(
                        icon: Icons.g_mobiledata,
                        color: Colors.red,
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Sign In Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFFc026d3),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
