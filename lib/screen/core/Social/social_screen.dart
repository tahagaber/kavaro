import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../constats/app_colors.dart';
import '../../../models/social.dart';
import 'widgets/social_header.dart';
import 'widgets/story_bar.dart';
import 'widgets/post_card.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SocialHeader(
                backgroundColor: AppColors.backgroundDark,
                borderColor: const Color(0x1AFFFFFF),
                primaryColor: AppColors.secondary,
              ),
            ),
            SliverToBoxAdapter(
              child: StoryBar(
                stories: SocialData.stories,
                primaryColor: AppColors.secondary,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: PostCard(post: SocialData.posts[index]),
                  );
                }, childCount: SocialData.posts.length),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
          ],
        ),
      ),
    );
  }
}
