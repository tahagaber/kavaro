import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../constats/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ["My Works", "Saved", "Store"];
  final List<Map<String, String>> _works = [
    {
      "name": "Neural Mech",
      "image": "assets/images/on_b_1.jpg",
      "price": "1.2 ETH",
    },
    {
      "name": "Cyber Core",
      "image": "assets/images/on_b_4.jpg",
      "price": "0.8 ETH",
    },
    {
      "name": "Void Walker",
      "image": "assets/images/on_b_6.jpg",
      "price": "2.1 ETH",
    },
    {
      "name": "Titan Gear",
      "image": "assets/images/on_b_3.jpg",
      "price": "1.5 ETH",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -50,
            child: _glow(250, AppColors.primary.withOpacity(0.15)),
          ),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 80),
              _header(),
              const SizedBox(height: 24),
              _actions(),
              const SizedBox(height: 30),
              _stats(),
              const SizedBox(height: 40),
              _tabsRow(),
              const SizedBox(height: 24),
              _grid(),
              const SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }

  Widget _glow(double size, Color color) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
      child: const SizedBox(),
    ),
  );

  Widget _header() => Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.secondary, width: 2),
            ),
          ),
          CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.backgroundDark,
            backgroundImage: const AssetImage('assets/images/kavaro.png'),
          ),
          Positioned(bottom: 0, right: 0, child: _badge("PRO")),
        ],
      ),
      const SizedBox(height: 20),
      const Text(
        "KaVaro",
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Text(
        "Digital Artist & 3D Designer",
        style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
      ),
    ],
  );

  Widget _actions() => Row(
    children: [
      Expanded(child: _btn("Edit Profile", Icons.edit_note, true)),
      const SizedBox(width: 12),
      _btn("", Icons.share, false, width: 60),
    ],
  );

  Widget _btn(String label, IconData icon, bool primary, {double? width}) =>
      Container(
        height: 52,
        width: width,
        decoration: BoxDecoration(
          gradient: primary ? AppColors.primaryGradient : null,
          color: primary ? null : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: primary
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            if (label.isNotEmpty) ...[
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
            ],
          ],
        ),
      );

  Widget _badge(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      gradient: AppColors.primaryGradient,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _stats() => Container(
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
    decoration: BoxDecoration(
      color: const Color(0xFF140E24),
      borderRadius: BorderRadius.circular(26),
      border: Border.all(color: Colors.white.withOpacity(0.05)),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _statItem("124", "PROJECTS"),
        _divider(),
        _statItem("18k", "FOLLOWERS"),
        _divider(),
        _statItem("842", "SALES"),
      ],
    ),
  );

  Widget _divider() =>
      Container(height: 30, width: 1, color: Colors.white.withOpacity(0.1));

  Widget _statItem(String val, String label) => Column(
    children: [
      Text(
        val,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        label,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 9,
          letterSpacing: 1,
        ),
      ),
    ],
  );

  Widget _tabsRow() => Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: const Color(0xFF140E24),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: List.generate(_tabs.length, (i) => Expanded(child: _tabBtn(i))),
    ),
  );

  Widget _tabBtn(int i) => GestureDetector(
    onTap: () => setState(() => _selectedTab = i),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        gradient: _selectedTab == i ? AppColors.primaryGradient : null,
        borderRadius: BorderRadius.circular(12),
        boxShadow: _selectedTab == i
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 10,
                ),
              ]
            : [],
      ),
      child: Center(
        child: Text(
          _tabs[i],
          style: TextStyle(
            color: _selectedTab == i ? Colors.white : Colors.white30,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    ),
  );

  Widget _grid() => GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 16,
      childAspectRatio: 0.8,
    ),
    itemCount: _works.length,
    itemBuilder: (_, i) => Container(
      decoration: BoxDecoration(
        color: const Color(0xFF140E24),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                _works[i]['image']!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _works[i]['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _works[i]['price']!,
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
