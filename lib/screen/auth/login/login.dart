import 'package:flutter/material.dart';
import 'package:kavaro/widgets/auth_text_field.dart';
import 'package:kavaro/widgets/gradient_button.dart';
import 'widgets/login_header.dart';
import 'widgets/social_auth_section.dart';
import 'widgets/signup_prompt.dart';
import '../sginup/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

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
                  const SizedBox(height: 60),

                  const LoginHeader(),

                  const SizedBox(height: 50),

                  // Email Field
                  const AuthTextField(
                    label: 'EMAIL ADDRESS',
                    hintText: 'name@example.com',
                    icon: Icons.email_outlined,
                  ),

                  const SizedBox(height: 25),

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

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF00d4aa),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Login Button
                  GradientButton(
                    text: 'Login to Experience',
                    icon: Icons.arrow_forward,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/onboarding');
                    },
                  ),

                  const SizedBox(height: 30),

                  // Social Section
                  SocialAuthSection(onAppleTap: () {}, onGoogleTap: () {}),

                  const SizedBox(height: 50),

                  // Sign Up Prompt
                  SignupPrompt(
                    onSignupTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
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
