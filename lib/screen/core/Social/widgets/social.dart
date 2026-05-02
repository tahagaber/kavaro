import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../constats/app_colors.dart';
import '../../../../models/social.dart';
import 'post_card.dart';
import 'social_header.dart';
import 'story_bar.dart';

class KavaroFeedPage extends StatefulWidget {
  const KavaroFeedPage({super.key});

  @override
  State<KavaroFeedPage> createState() => _KavaroFeedPageState();
}

class _KavaroFeedPageState extends State<KavaroFeedPage> {
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
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: PostCard(post: SocialData.posts[index]),
                    );
                  },
                  childCount: SocialData.posts.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
          ],
        ),
      ),
    );
  }
}