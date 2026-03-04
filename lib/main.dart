import 'package:flutter/material.dart';
import 'package:kavaro/screen/Splash/splash.dart';
import 'package:kavaro/screen/auth/login/login.dart';
import 'package:kavaro/screen/auth/sginup/signup.dart';
import 'package:kavaro/screen/core/home/home.dart';
import 'package:kavaro/screen/Onboarding/onboarding.dart';
import 'package:kavaro/screen/auth/OTB/otb_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kavaro',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFC025F4),
        scaffoldBackgroundColor: const Color(0xFF05050A),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/otb': (context) => const OtbScreen(),
      },
    );
  }
}
