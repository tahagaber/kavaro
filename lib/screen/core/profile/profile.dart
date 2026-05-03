import 'package:flutter/material.dart';
import '../../../constats/app_colors.dart';
import 'widgets/profile_glow.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_actions.dart';
import 'widgets/profile_stats.dart';
import 'widgets/profile_tabs.dart';
import 'widgets/profile_grid.dart';

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
            child: ProfileGlow(
              size: 250,
              color: AppColors.primary.withOpacity(0.15),
            ),
          ),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 80),
              const ProfileHeader(),
              const SizedBox(height: 24),
              const ProfileActions(),
              const SizedBox(height: 30),
              const ProfileStats(),
              const SizedBox(height: 40),
              ProfileTabs(
                tabs: _tabs,
                selectedTab: _selectedTab,
                onTabChanged: (index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
              ),
              const SizedBox(height: 24),
              ProfileGrid(works: _works),
              const SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }
}
