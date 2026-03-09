import 'package:flutter/material.dart';
import '../../../../constats/app_colors.dart';
import '../models/social_models.dart';
import 'story_item.dart';

class StoryBar extends StatelessWidget {
  final List<StoryUser> stories;

  const StoryBar({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.textSecondary.withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: AppColors.textSecondary,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Your Story',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          ...stories.map(
            (story) => Padding(
              padding: const EdgeInsets.only(right: 20),
              child: StoryItem(story: story),
            ),
          ),
        ],
      ),
    );
  }
}
