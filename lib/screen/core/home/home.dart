import 'package:flutter/material.dart';
import 'package:kavaro/widgets/custom_bottom_nav_bar.dart';
import 'package:kavaro/constats/app_colors.dart';
import 'package:kavaro/screen/core/home/widgets/home_header.dart';
import 'package:kavaro/screen/core/home/widgets/home_categories.dart';
import 'package:kavaro/screen/core/home/widgets/home_trending.dart';
import 'package:kavaro/screen/core/home/widgets/home_featured.dart';
import 'package:kavaro/screen/core/Market/market.dart';
import 'package:kavaro/screen/core/Social/social_screen.dart';
import 'package:kavaro/widgets/custom_right_drawer.dart';
import 'package:kavaro/models/market_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    const _HomeContent(),
    const MarketScreen(),
    const SocialScreen(),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      drawer: const Drawer(),
      endDrawer: const CustomRightDrawer(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedTab,
        onItemTapped: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundDark,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundDark,
              AppColors.backgroundDark,
              Color(0xFF130B1E),
            ],
            stops: [0.0, 0.7, 1.0],
          ),
        ),
        child: IndexedStack(index: _selectedTab, children: _pages),
      ),
    );
  }
}

class _HomeContent extends StatefulWidget {
  const _HomeContent();

  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  int _selectedCategory = 0;

  final List<String> categories = [
    'All',
    '3D Prints',
    'Digital Files',
    'Bundles',
  ];

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 140,
          top: topPadding > 0 ? topPadding : 10,
        ),
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
            HomeFeaturedSection(featuredProjects: MarketModel.featuredProjects),
          ],
        ),
      ),
    );
  }
}
