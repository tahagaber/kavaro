import 'package:flutter/material.dart';

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

                  // Logo
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFc9a86c),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.eco, color: Colors.white, size: 35),
                  ),

                  const SizedBox(height: 15),

                  // Brand Name
                  const Text(
                    'KAVARO',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFf5e6c8),
                      letterSpacing: 3,
                    ),
                  ),

                  // Decorative line
                  Container(
                    width: 140,
                    height: 2,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color(0xFF00d4aa),
                          Colors.transparent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Tagline
                  const Text(
                    'START YOUR JOURNEY',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Full Name Field
                  _buildInputLabel('FULL NAME'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    hintText: 'John Doe',
                    icon: Icons.person_outline,
                    isPassword: false,
                  ),

                  const SizedBox(height: 20),

                  // Email Field
                  _buildInputLabel('EMAIL ADDRESS'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    hintText: 'name@example.com',
                    icon: Icons.email_outlined,
                    isPassword: false,
                  ),

                  const SizedBox(height: 20),

                  // Phone Number Field
                  _buildInputLabel('PHONE NUMBER'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    hintText: '+1 234 567 890',
                    icon: Icons.phone_android_outlined,
                    isPassword: false,
                  ),

                  const SizedBox(height: 20),

                  // Password Field
                  _buildInputLabel('PASSWORD'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    hintText: '••••••••',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    toggleVisibility: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    obscureText: _obscurePassword,
                  ),

                  const SizedBox(height: 20),

                  // Confirm Password Field
                  _buildInputLabel('CONFIRM PASSWORD'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    hintText: '••••••••',
                    icon: Icons.lock_clock_outlined,
                    isPassword: true,
                    toggleVisibility: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    obscureText: _obscureConfirmPassword,
                  ),

                  const SizedBox(height: 35),

                  // Sign Up Button
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9333ea), Color(0xFFc026d3)],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF9333ea).withOpacity(0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Create Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
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
                      _buildSocialButton(Icons.apple, Colors.white),
                      const SizedBox(width: 20),
                      _buildSocialButton(Icons.g_mobiledata, Colors.red),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Sign In
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

  Widget _buildInputLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    required bool isPassword,
    VoidCallback? toggleVisibility,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1a1a2e),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF9333ea).withOpacity(0.3)),
      ),
      child: TextField(
        obscureText: isPassword ? obscureText : false,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: toggleVisibility,
                )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFF1a1a2e),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: 28),
        onPressed: () {},
      ),
    );
  }
}
