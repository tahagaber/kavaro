import 'package:flutter/material.dart';
import 'package:kavaro/screen/Onboarding/Widgets/onboarding_data.dart';
import 'package:kavaro/screen/Onboarding/Widgets/onboarding_background.dart';
import 'package:kavaro/screen/Onboarding/Widgets/onboarding_hud.dart';
import 'package:kavaro/screen/Onboarding/Widgets/onboarding_page_content.dart';
import 'package:kavaro/screen/Onboarding/Widgets/onboarding_bottom_panel.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: 'Capture Reality',
      description:
          'Scan any object with your camera and turn it into a high-quality 3D model instantly using AI.',
      imagePath: 'assets/images/onboarding_1.jpg',
    ),
    OnboardingData(
      title: 'Explore 3D',
      description:
          'Discover millions of premium 3D models and digital files from top creators around the globe.',
      imagePath: 'assets/images/onboarding_2.jpg',
    ),
    OnboardingData(
      title: 'Bring To Life',
      description:
          'Print, animate, or integrate the 3D models directly into your projects seamlessly.',
      imagePath: 'assets/images/onboarding_3.jpg',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      body: Stack(
        children: [
          const OnboardingBackground(),
          OnboardingHud(currentIndex: _currentIndex),
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return OnboardingPageContent(data: _onboardingData[index]);
            },
          ),
          OnboardingBottomPanel(
            currentIndex: _currentIndex,
            onboardingData: _onboardingData,
            onNextPressed: _nextPage,
          ),
        ],
      ),
    );
  }
}
