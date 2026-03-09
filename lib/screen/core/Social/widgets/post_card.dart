import 'package:flutter/material.dart';
import '../../../../constats/app_colors.dart';
import '../models/social_models.dart';

class PostCard extends StatefulWidget {
  final String username,
      userRole,
      avatarUrl,
      imageUrl,
      title,
      description,
      tags,
      likes,
      comments,
      actionLabel;
  final Color userRoleColor;
  final bool isFollowing, isLiked, isBookmarked;
  final double imageAspectRatio;
  final List<PostBadge> badges;
  final IconData actionIcon;

  const PostCard({
    super.key,
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

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late bool _liked;
  late bool _bookmarked;
  late bool _following;

  @override
  void initState() {
    super.initState();
    _liked = widget.isLiked;
    _bookmarked = widget.isBookmarked;
    _following = widget.isFollowing;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder, width: 1),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildUserHeader(), _buildImageArea(), _buildContent()],
      ),
    );
  }

  Widget _buildUserHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.secondary, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary.withOpacity(0.5),
                  blurRadius: 8,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                widget.avatarUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(color: AppColors.backgroundLight),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.username,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.userRole.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: widget.userRoleColor,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _following = !_following),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: _following
                    ? AppColors.backgroundLight
                    : AppColors.secondary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                _following ? 'Following' : 'Follow',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: _following ? Colors.white : AppColors.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageArea() {
    return AspectRatio(
      aspectRatio: widget.imageAspectRatio,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: AppColors.backgroundLight),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Wrap(
              spacing: 8,
              children: widget.badges.map((b) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: b.isPrimary
                        ? AppColors.secondary.withOpacity(0.85)
                        : Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (b.icon != null) ...[
                        Icon(b.icon, color: Colors.white, size: 13),
                        const SizedBox(width: 4),
                      ],
                      Text(
                        b.text,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          if (widget.imageAspectRatio == 1.0)
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.fullscreen_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _liked = !_liked),
                    child: Row(
                      children: [
                        Icon(
                          _liked
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: _liked
                              ? AppColors.secondary
                              : AppColors.textSecondary,
                          size: 22,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.likes,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: _liked
                                ? AppColors.secondary
                                : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline_rounded,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '84',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.send_outlined,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => setState(() => _bookmarked = !_bookmarked),
                child: Icon(
                  _bookmarked
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  color: _bookmarked
                      ? AppColors.secondary
                      : AppColors.textSecondary,
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              children: [
                TextSpan(text: '${widget.description} '),
                TextSpan(
                  text: widget.tags,
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(widget.actionIcon, size: 18),
              label: Text(
                widget.actionLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
