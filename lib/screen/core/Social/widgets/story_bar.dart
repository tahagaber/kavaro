import 'package:flutter/material.dart';
import '../../../../models/social.dart';
import 'story_item.dart';

class StoryBar extends StatelessWidget {
  final List<StoryUser> stories;
  final Color primaryColor;

  const StoryBar({
    super.key,
    required this.stories,
    required this.primaryColor,
  });

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
                      color: const Color(0xFF64748B).withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.add, color: Color(0xFF64748B), size: 28),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Your Story',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF94A3B8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          ...stories.map(
            (story) => Padding(
              padding: const EdgeInsets.only(right: 20),
              child: StoryItem(story: story, primaryColor: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
