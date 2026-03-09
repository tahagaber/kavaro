import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:kavaro/constats/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Colors inspired directly from AppColors
    // Premium glass effect: lower opacity and higher blur
    final navBarBgColor = const Color(0xFF1A1625).withOpacity(0.35);
    final shadowColor = const Color(0xFF000000).withOpacity(0.3);

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 45),
      height: 75,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Nav bar semi-rounded background with glassmorphism effect
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: navBarBgColor,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Navigation icons and labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(Icons.home, 'HOME', 0),
              _buildNavItem(Icons.shopping_bag, 'SHOP', 1),
              const SizedBox(width: 80), // Space padding for the middle FAB
              _buildNavItem(Icons.groups, 'FEED', 2),
              _buildNavItem(Icons.person, 'YOU', 3),
            ],
          ),

          // Floating Action Button
          Positioned(
            top: -26,
            child: _AnimatedFab(borderColor: AppColors.backgroundDark),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    const primaryColor = Color(0xFF9824FF);
    final isActive = selectedIndex == index;
    // Inactive is a blueish-grey to match the image
    final color = isActive ? primaryColor : const Color(0xFF8E95A3);

    return GestureDetector(
      onTap: () => onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedFab extends StatefulWidget {
  final Color borderColor;
  const _AnimatedFab({Key? key, required this.borderColor}) : super(key: key);

  @override
  State<_AnimatedFab> createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<_AnimatedFab> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF9824FF);
    const hoverColor = Color(0xFF3B82F6); // Secondary blue for hover

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedRotation(
        turns: _isHovered ? 0.125 : 0, // 45 degree rotation
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        child: AnimatedScale(
          scale: _isHovered ? 1.15 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: _isHovered ? hoverColor : primaryColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(
                  0xFF08040C,
                ).withOpacity(0.8), // Thinner dark border
                width: 4.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: (_isHovered ? hoverColor : primaryColor).withOpacity(
                    _isHovered ? 0.5 : 0.25,
                  ),
                  blurRadius: _isHovered ? 15 : 12,
                  spreadRadius: _isHovered ? 4 : 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 32),
          ),
        ),
      ),
    );
  }
}
