import 'package:flutter/material.dart';

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
