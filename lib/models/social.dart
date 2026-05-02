import 'package:flutter/material.dart';
import '../constats/app_colors.dart';

class StoryUser {
  final String name, imageUrl;
  final bool isActive;
  StoryUser({
    required this.name,
    required this.imageUrl,
    required this.isActive,
  });
}

class PostBadge {
  final String text;
  final IconData? icon;
  final bool isPrimary;
  const PostBadge({required this.text, this.icon, this.isPrimary = false});
}

class SocialPost {
  final String username;
  final String userRole;
  final Color userRoleColor;
  final String avatarUrl;
  final bool isFollowing;
  final String imageUrl;
  final double imageAspectRatio;
  final List<PostBadge> badges;
  final String title;
  final String description;
  final String tags;
  final String likes;
  final String comments;
  final bool isLiked;
  final bool isBookmarked;
  final String actionLabel;
  final IconData actionIcon;

  const SocialPost({
    required this.username,
    required this.userRole,
    required this.userRoleColor,
    required this.avatarUrl,
    required this.isFollowing,
    required this.imageUrl,
    required this.imageAspectRatio,
    required this.badges,
    required this.title,
    required this.description,
    required this.tags,
    required this.likes,
    required this.comments,
    required this.isLiked,
    required this.isBookmarked,
    required this.actionLabel,
    required this.actionIcon,
  });
}

class SocialData {
  static final List<StoryUser> stories = [
    StoryUser(
      name: 'Tasnim',
      isActive: true,
      imageUrl: 'assets/images/img1.jpg',
    ),
    StoryUser(name: 'Taha', isActive: true, imageUrl: 'assets/images/Taha.jpg'),
    StoryUser(
      name: 'Menaa',
      isActive: false,
      imageUrl: 'assets/images/img2.jpg',
    ),
    StoryUser(
      name: 'Mahmoud',
      isActive: true,
      imageUrl: 'assets/images/img3.jpg',
    ),
    StoryUser(
      name: 'Ibrahim',
      isActive: true,
      imageUrl: 'assets/images/img4.jpg',
    ),
    StoryUser(
      name: 'Ibrahim',
      isActive: true,
      imageUrl: 'assets/images/img4.jpg',
    ),
  ];

  static final List<SocialPost> posts = [
    const SocialPost(
      username: 'NeoDesigner',
      userRole: 'Master Creator',
      userRoleColor: AppColors.secondary,
      avatarUrl: 'assets/images/arm.png',
      isFollowing: false,
      imageUrl: 'assets/images/arm.png',
      imageAspectRatio: 1.0,
      badges: [
        PostBadge(text: '3D INTERACTIVE', icon: Icons.view_in_ar_rounded),
        PostBadge(text: 'FDM READY', isPrimary: true),
      ],
      title: 'Cyberpunk Mechanical Arm V2',
      description:
          'High-res 3D render optimized for FDM printing. Features modular joints and magnetic attachments.',
      tags: '#Cyberpunk #3DPrinting #Mech #Robotics',
      likes: '1.2k',
      comments: '84',
      isLiked: true,
      isBookmarked: false,
      actionLabel: 'Download STL (42MB)',
      actionIcon: Icons.download_rounded,
    ),
    const SocialPost(
      username: 'Lumina3D',
      userRole: 'In-Studio',
      userRoleColor: Color(0xFF10B981),
      avatarUrl: 'assets/images/img1.jpg',
      isFollowing: true,
      imageUrl: 'assets/images/on_b_6.jpg',
      imageAspectRatio: 4 / 3,
      badges: [PostBadge(text: 'PREMIUM ASSET')],
      title: 'Vaporwave Workstation',
      description:
          'A nostalgic journey back to the 80s hardware era. Designed for architectural visualization and game dev.',
      tags: '#Vaporwave #Retro #Archviz',
      likes: '856',
      comments: '32',
      isLiked: false,
      isBookmarked: true,
      actionLabel: 'Unlock Full Pack (\$12.00)',
      actionIcon: Icons.shopping_cart_rounded,
    ),
  ];
}
