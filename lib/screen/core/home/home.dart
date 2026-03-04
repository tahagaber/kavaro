import 'package:flutter/material.dart';
import 'package:kavaro/widgets/custom_bottom_nav_bar.dart';
import 'package:kavaro/screen/core/home/widgets/home_constants.dart';
import 'package:kavaro/screen/core/home/widgets/home_header.dart';
import 'package:kavaro/screen/core/home/widgets/home_categories.dart';
import 'package:kavaro/screen/core/home/widgets/home_trending.dart';
import 'package:kavaro/screen/core/home/widgets/home_featured.dart';

void main() {
  runApp(const KavaroApp());
}

class KavaroApp extends StatelessWidget {
  const KavaroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kavaro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0B14),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  int _selectedCategory = 0;

  final List<String> categories = [
    'All',
    '3D Prints',
    'Digital Files',
    'Bundles',
  ];

  final List<Map<String, dynamic>> featuredProjects = [
    {
      'name': 'Titan-Gears V4',
      'views': '2.4k views',
      'price': '\$12.00',
      'isFree': false,
      'image': kTitanGearsUrl,
    },
    {
      'name': 'Elder Dragon Bust',
      'views': '1.8k views',
      'price': 'Free',
      'isFree': true,
      'image': kElderDragonUrl,
    },
    {
      'name': 'Nebula Fragment',
      'views': '920 views',
      'price': '\$4.50',
      'isFree': false,
      'image': kNebulaUrl,
    },
    {
      'name': 'Iso-Lamp Unit',
      'views': '3.1k views',
      'price': '\$19.99',
      'isFree': false,
      'image': kIsoLampUrl,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0B14),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),
                    const SizedBox(height: 16),
                    HomeCategories(
                      categories: categories,
                      selectedCategory: _selectedCategory,
                      onCategorySelected: (index) {
                        setState(() {
                          _selectedCategory = index;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    const HomeTrendingSection(),
                    const SizedBox(height: 28),
                    HomeFeaturedSection(featuredProjects: featuredProjects),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavBar(
                selectedIndex: _selectedTab,
                onItemTapped: (index) {
                  setState(() => _selectedTab = index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
