import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF7F13EC);
  static const Color primaryLight = Color(0xFF9824FF);
  static const Color secondary = Color(0xFF3B82F6);

  // Background colors
  static const Color backgroundDark = Color(
    0xFF0D0B14,
  ); // Deepest dark for overall scaffold
  static const Color backgroundLight = Color(
    0xFF130B1E,
  ); // Slightly lighter for containers/nav
  static const Color surface = Color(
    0xFF191022,
  ); // Surface color used in market and others

  // Glassmorphism colors
  static const Color glassBackground = Color(0x99302839);
  static const Color glassBorder = Color(
    0x1FFFFFFF,
  ); // White path with low opacity

  // Text colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF8E95A3);
  static const Color textMuted = Colors.grey;

  // Status colors
  static const Color accent = Color(0xFFA533FF);
  static const Color rating = Colors.amber;

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient fabGradient = LinearGradient(
    colors: [primaryLight, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
