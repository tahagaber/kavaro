import 'package:flutter/material.dart';

class MarketModel {
  // Asset Constants
  static const String avatarUrl = 'assets/images/img1.jpg';
  static const String cyberRoninUrl = 'assets/images/img1.jpg';
  static const String vortexUrl = 'assets/images/img2.jpg';
  static const String titanGearsUrl = 'assets/images/img3.jpg';
  static const String elderDragonUrl = 'assets/images/img4.jpg';
  static const String nebulaUrl = 'assets/images/img5.jpg';
  static const String isoLampUrl = 'assets/images/img1.jpg';

  static const List<Map<String, dynamic>> featuredProjects = [
    {
      'name': 'Titan-Gears V4',
      'views': '2.4k views',
      'price': '12.00 EG',
      'isFree': false,
      'image': titanGearsUrl,
      'rating': 4.9,
      'reviews': 124,
    },
    {
      'name': 'Elder Dragon Bust',
      'views': '1.8k views',
      'price': 'Free',
      'isFree': true,
      'image': elderDragonUrl,
      'rating': 4.7,
      'reviews': 89,
    },
    {
      'name': 'Nebula Fragment',
      'views': '920 views',
      'price': '4.50 EG',
      'isFree': false,
      'image': nebulaUrl,
      'rating': 5.0,
      'reviews': 215,
    },
    {
      'name': 'Iso-Lamp Unit',
      'views': '3.1k views',
      'price': '19.99 EG',
      'isFree': false,
      'image': isoLampUrl,
      'rating': 4.8,
      'reviews': 56,
    },
  ];

  static const List<String> categories = [
    'All Assets',
    'Characters',
    'Environments',
    'Vehicles',
    'Materials',
  ];

  static const List<Map<String, dynamic>> ads = [
    {
      'title': 'New Cyber Drop',
      'subtitle': 'Explore our latest 3D characters\nwith 20% discount!',
      'image': 'assets/images/img3.jpg',
      'color': Color(0xFF7F13EC),
    },
    {
      'title': 'Environment Sale',
      'subtitle': 'Level up your game worlds\nwith premium assets.',
      'image': 'assets/images/img2.jpg',
      'color': Color(0xFF3B82F6),
    },
    {
      'title': 'Pro Materials',
      'subtitle': 'Ultra-realistic PBR textures\nnow available in-store.',
      'image': 'assets/images/img1.jpg',
      'color': Color(0xFF7C3AED),
    },
  ];

  static const List<Map<String, dynamic>> models = [
    // CHARACTERS
    {
      'name': 'Vanguard Helmet',
      'category': 'Characters',
      'image': 'assets/images/img1.jpg',
      'rating': 4.9,
      'reviews': 124,
      'price': 24.00,
    },
    {
      'name': 'Mecha Unit 01',
      'category': 'Characters',
      'image': 'assets/images/img2.jpg',
      'rating': 4.8,
      'reviews': 156,
      'price': 120.00,
    },
    {
      'name': 'Cyber Ninja',
      'category': 'Characters',
      'image': 'assets/images/img3.jpg',
      'rating': 4.9,
      'reviews': 210,
      'price': 45.00,
    },
    {
      'name': 'Steampunk Engineer',
      'category': 'Characters',
      'image': 'assets/images/img4.jpg',
      'rating': 4.7,
      'reviews': 95,
      'price': 35.00,
    },

    // ENVIRONMENTS
    {
      'name': 'Sci-Fi Corridor',
      'category': 'Environments',
      'image': 'assets/images/img5.jpg',
      'rating': 4.9,
      'reviews': 312,
      'price': 85.00,
    },
    {
      'name': 'Gothic Archways',
      'category': 'Environments',
      'image': 'assets/images/arm.png',
      'rating': 5.0,
      'reviews': 45,
      'price': 15.00,
    },
    {
      'name': 'Neon Citystreet',
      'category': 'Environments',
      'image': 'assets/images/img1.jpg',
      'rating': 4.8,
      'reviews': 180,
      'price': 65.00,
    },
    {
      'name': 'Ancient Temple',
      'category': 'Environments',
      'image': 'assets/images/img2.jpg',
      'rating': 4.9,
      'reviews': 120,
      'price': 40.00,
    },

    // VEHICLES
    {
      'name': 'Recon Drone X1',
      'category': 'Vehicles',
      'image': 'assets/prodcut_games/Gaming_1.jpg',
      'rating': 4.7,
      'reviews': 89,
      'price': 45.00,
    },
    {
      'name': 'Desert Buggy',
      'category': 'Vehicles',
      'image': 'assets/prodcut_games/Stand_lap.jpeg',
      'rating': 4.6,
      'reviews': 78,
      'price': 35.00,
    },
    {
      'name': 'Cyber Bike',
      'category': 'Vehicles',
      'image': 'assets/prodcut_games/Gaming_1.jpg',
      'rating': 4.8,
      'reviews': 62,
      'price': 55.00,
    },
    {
      'name': 'Space Freighter',
      'category': 'Vehicles',
      'image': 'assets/prodcut_games/Stand_lap.jpeg',
      'rating': 4.9,
      'reviews': 41,
      'price': 95.00,
    },

    // MATERIALS
    {
      'name': 'Crystal Pack PBR',
      'category': 'Materials',
      'image': 'assets/images/img3.jpg',
      'rating': 5.0,
      'reviews': 215,
      'price': 12.50,
    },
    {
      'name': 'Titanium Texture',
      'category': 'Materials',
      'image': 'assets/images/img4.jpg',
      'rating': 4.8,
      'reviews': 56,
      'price': 9.00,
    },
    {
      'name': 'Aged Cooper',
      'category': 'Materials',
      'image': 'assets/images/img5.jpg',
      'rating': 4.7,
      'reviews': 34,
      'price': 8.50,
    },
    {
      'name': 'Lava Shader',
      'category': 'Materials',
      'image': 'assets/images/arm.png',
      'rating': 4.9,
      'reviews': 88,
      'price': 14.00,
    },
  ];
}
