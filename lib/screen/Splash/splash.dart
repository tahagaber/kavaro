import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05050A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.15)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC025F4).withOpacity(0.3),
                    blurRadius: 60,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: const Icon(
                Icons.eco_rounded,
                size: 64,
                color: Color(0xFFC025F4),
              ),
            ),

            const SizedBox(height: 40),

            // Title
            Text(
              'KAVARO',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                color: const Color(0xFFf5e6c8),
                shadows: [
                  Shadow(
                    color: const Color(0xFFC025F4).withOpacity(0.5),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Subtitle
            Text(
              'ELEVATE YOUR REALITY',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 12,
                letterSpacing: 6,
                color: const Color(0xFFC025F4).withOpacity(0.6),
              ),
            ),

            const SizedBox(height: 80),

            // Loading
            SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                backgroundColor: Colors.white.withOpacity(0.1),
                valueColor: const AlwaysStoppedAnimation(Color(0xFFC025F4)),
                minHeight: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
