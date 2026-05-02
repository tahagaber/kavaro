import 'package:flutter/material.dart';
import '../../constats/app_colors.dart';
import 'Widgets/animated_logo.dart';
import 'Widgets/blur_circle.dart';
import 'Widgets/branding_text.dart';
import 'Widgets/progress_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500))..forward();

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5, curve: Curves.easeIn));
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack)));
    _progressAnimation = CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0, curve: Curves.linear));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) Navigator.pushReplacementNamed(context, '/login');
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          Positioned(top: -100, right: -50, child: BlurCircle(color: AppColors.primary.withOpacity(0.12), size: 300)),
          Positioned(bottom: -50, left: -50, child: BlurCircle(color: AppColors.secondary.withOpacity(0.12), size: 250)),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AnimatedLogo(),
                        const SizedBox(height: 32),
                        const BrandingText(),
                        const SizedBox(height: 48),
                        ProgressBar(progress: _progressAnimation.value),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
