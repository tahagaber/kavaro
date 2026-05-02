import 'package:flutter/material.dart';
import '../../../../constats/app_colors.dart';
import '../../../../models/social.dart';

class StoryItem extends StatelessWidget {
  final StoryUser story;
  final Color? primaryColor;

  const StoryItem({super.key, required this.story, this.primaryColor});

  @override
  Widget build(BuildContext context) {
    final activeColor = primaryColor ?? AppColors.secondary;
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: story.isActive
                  ? activeColor
                  : activeColor.withOpacity(0.3),
              width: 2,
            ),
            boxShadow: story.isActive
                ? [
                    BoxShadow(
                      color: activeColor.withOpacity(0.5),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: ClipOval(
            child: Image.asset(
              story.imageUrl,
              fit: BoxFit.cover,
              opacity: AlwaysStoppedAnimation(story.isActive ? 1.0 : 0.6),
              errorBuilder: (_, __, ___) => Container(color: AppColors.surface),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          story.name,
          style: TextStyle(
            fontSize: 11,
            color: story.isActive ? Colors.white : AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
