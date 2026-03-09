import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color kPrimary = Color(0xFF135BEC);
const Color kBgDark = Color(0xFF0A0C10);
const Color kBorderDark = Color(0x1AFFFFFF);

class KavaroFeedPage extends StatefulWidget {
  const KavaroFeedPage({super.key});

  @override
  State<KavaroFeedPage> createState() => _KavaroFeedPageState();
}

class _KavaroFeedPageState extends State<KavaroFeedPage> {
  int _selectedIndex = 0;

  final List<_StoryUser> _stories = [
    _StoryUser(name: 'NeoDev', isActive: true, imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuABuBnlMYS9Nkn4O6K0c_GdgiCkG2LpGC1qWoQuHuN_7Ek_6DKfyQ9vVFuvGADmdDBBn0eH7N_BIKJBiPqqcCNUW4vXhPuFgTT88C1amHHsqdmiX5c3DXaV3IEnjolOyzbiw7_7f9hm7kRQzcjb-MBhtSYUeYPq4VzKl92GBbFHGppKwZKideAhcAvg57RM1iK2UBKzd0uYRm5MAP-jKlTYefgwmbuTo-HDWNFaKudeciAVgbutR8NlP1ePcDYzNYK7iMWP51oaH6U'),
    _StoryUser(name: 'Lumina3D', isActive: true, imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAy7NrIkpbi8hWLd3HErB-OAKaq_l3oPI6wtziFnPhYRwuBclYwsVwsogEddScrlEyB1eGNll6k09nCbWrmExeF5JFTTJlCIvStZRMAtCrOkiuNPmUKTr1s6AVTocuoxPbQeFQEN4aa2_GvHfreOIVlWjQ8doE2r5e-xwGvMNZXmr1IYPGfLVTTTSCysoer9P4CVou9WqXsbYRoWFJS4XbdaLxIRKwq7Y3zlV3mTKn8DSNoF0cGTg2aLF3WXS__4EYqTCJ0Onzkcvs'),
    _StoryUser(name: 'VoxelArt', isActive: false, imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBkflzOJpWwS0BiTm4ZXJHR1zRfzfUTT_RUR-oycwcfQq5VCL8vsJwl7ck9aYLtpft9KefDMfPXY0EVZTP_OdEdkhoFkkBoSXR4kaCTetinGN1opcZkq4rcElk5R-bt9np2nsm-byOOfhx64CGtVXD_MTvCdYaRZauUcvGhJTyJmNrc5_jXpVcMH2KGKqAtTQjHkI7Ss0hXe8SATFgg5C4ZOh9M15SKRDRR5y7SNlBXUxUGlL-E2wUrOCB9_Y5tuOUrZcEvJAaM8WY'),
    _StoryUser(name: 'MechaSoul', isActive: true, imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAG1l4mxtqin0VtY15-gihEHwV-20JM6hmIBsRsLIjRBqjnY6zS310Yvav7P1hUgN6ez6zJ9-gwGyROOHPi8UqZuh2YK6sxlMneigOfsww2DbcyWjqP9KDGc1cEF65AORlDAGML6H3crSVFtHHjVIkNqmpirkN58lpFJmqVwi4obZCRfabUJDXICBeU_EWpLFChJA1lQLJTMgeP-bejgZX-hdfDgeHEZ96qefztDpIthASYyAnCm3zhTicM_FievBics368dJBkqUw'),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: kBgDark,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _buildHeader()),
                SliverToBoxAdapter(child: _buildStoriesBar()),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildPost1(),
                      const SizedBox(height: 24),
                      _buildPost2(),
                      const SizedBox(height: 120),
                    ]),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 100,
              right: 24,
              child: _buildFAB(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomNav(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: kBgDark.withOpacity(0.85),
        border: const Border(bottom: BorderSide(color: kBorderDark, width: 1)),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        bottom: 12,
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(Icons.view_in_ar_rounded, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 8),
              const Text(
                'KAVARO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search_rounded),
                color: const Color(0xFF94A3B8),
                onPressed: () {},
              ),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    color: const Color(0xFF94A3B8),
                    onPressed: () {},
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: kPrimary,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBgDark, width: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStoriesBar() {
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
                  style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8), fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          ..._stories.map((story) => Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _buildStoryItem(story),
              )),
        ],
      ),
    );
  }

  Widget _buildStoryItem(_StoryUser story) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: story.isActive ? kPrimary : kPrimary.withOpacity(0.3),
              width: 2,
            ),
            boxShadow: story.isActive
                ? [BoxShadow(color: kPrimary.withOpacity(0.5), blurRadius: 8, spreadRadius: 1)]
                : [],
          ),
          child: ClipOval(
            child: Image.network(
              story.imageUrl,
              fit: BoxFit.cover,
              opacity: AlwaysStoppedAnimation(story.isActive ? 1.0 : 0.6),
              errorBuilder: (_, __, ___) => Container(color: const Color(0xFF1E293B)),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          story.name,
          style: TextStyle(
            fontSize: 11,
            color: story.isActive ? Colors.white : const Color(0xFF94A3B8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPost1() {
    return _PostCard(
      username: 'NeoDesigner',
      userRole: 'Master Creator',
      userRoleColor: kPrimary,
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC3mT6OyDsHM1u3NpIXy29EIWVcQKTfu3v9RkHCmO_mb88nRCdl8zFF9bFE63_NHodtHZwDq2f6DgDUxEV9YcW_CcQ5XUR6JqioxjYv3jeYSwLQsLJ1WB7VqUQX6mlcaQuuL8iCAvi3KYRHngSaHcCXdw_2nmERLLxV_OFOB6q5aDS1A-B568Qq1h5-7nlUHVp80HLPka4zdy1ksFVxGkXtrel4rqs6WD_igar1-uUc5pNGyS-02-5B2Uj3b8JfVuJ_o492CDq810w',
      isFollowing: false,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDJjcYvUech4cA9DnXYUQHOm2J3CDTL3N1OEob6rnW0UXMUmAxf1piq6SlN0BvyXfT1NLclYGrA4qh6N5yYdFS-oynhCknIMr4jOE6zMm2b4A57WM7ltLdUX0rdhVqDABQH8_ux09gB2LPcKSwxOI_ao0UmC1crHEP9Yv_jdfAjZy2BjQm4hx6EGzMjKWJqwjMEOii2Y9-MAStjBzMaKltpPDSGCB3-4UGoxD-FJJ3mwBe6c9APjAioTL2okVdZtWtCTnehbff-tsY',
      imageAspectRatio: 1.0,
      badges: const [
        _Badge(text: '3D INTERACTIVE', icon: Icons.view_in_ar_rounded),
        _Badge(text: 'FDM READY', isPrimary: true),
      ],
      title: 'Cyberpunk Mechanical Arm V2',
      description: 'High-res 3D render optimized for FDM printing. Features modular joints and magnetic attachments.',
      tags: '#Cyberpunk #3DPrinting #Mech #Robotics',
      likes: '1.2k',
      comments: '84',
      isLiked: true,
      isBookmarked: false,
      actionLabel: 'Download STL (42MB)',
      actionIcon: Icons.download_rounded,
    );
  }

  Widget _buildPost2() {
    return _PostCard(
      username: 'Lumina3D',
      userRole: 'In-Studio',
      userRoleColor: const Color(0xFF10B981),
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAVRndwKLktC1twcuRKkL8pJJIxa0pSYOFUIiIH0XhxUFYSPlqFAXhlFtqa3sBMtN8KpyGKdorXsGwtc5nlsj58xv_XeFwzKD7h7388npsPbb1xnaSvrtED-eJzH0zLOJqsEC662IFlaQEzGGa0EOdM-1J99bV6fmfs2HOX40Vwa6KJdt7oTYraCu5t7U_aS5exrzQCV9DKsMTfpt56arg49m6MZDmwHgNT04I7WMr1WPgVjj42mc0DN0GayQZTexHFfdjWPIstkCk',
      isFollowing: true,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBxNC6reEt0Q7D3_h7myE8i8SDQwPeeOO_GhzVEy2MZYBAxBLtM-bZNdysTozeGcHxxEyrt5hHRViWkwVv7JfD8pGssexeoPKGKQTV1aIWS7BCfnbhRNt_hFIRepL2xiMKhJz1HtRqgKCz2XGkjdzLCFFQeg9Yea7oN9LQ4IYVCPb43OXOrcy1KiGlMe9JOCa5m5ULdLmME8D2gGobkYgtxIMYfHUZQ-KX90VCSrz6lPKNWhhXHfU-n_4I8Ca94bsdZnTzYRsHetz0',
      imageAspectRatio: 4 / 3,
      badges: const [
        _Badge(text: 'PREMIUM ASSET'),
      ],
      title: 'Vaporwave Workstation',
      description: 'A nostalgic journey back to the 80s hardware era. Designed for architectural visualization and game dev.',
      tags: '#Vaporwave #Retro #Archviz',
      likes: '856',
      comments: '32',
      isLiked: false,
      isBookmarked: true,
      actionLabel: 'Unlock Full Pack (\$12.00)',
      actionIcon: Icons.shopping_cart_rounded,
    );
  }

  Widget _buildFAB() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: kPrimary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: kPrimary.withOpacity(0.45), blurRadius: 20, spreadRadius: 2),
          ],
        ),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: kBgDark.withOpacity(0.85),
        border: const Border(top: BorderSide(color: kBorderDark, width: 1)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 8,
        top: 12,
        left: 24,
        right: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(icon: Icons.home_rounded, label: 'Home', isSelected: _selectedIndex == 0, onTap: () => setState(() => _selectedIndex = 0)),
          _NavItem(icon: Icons.explore_outlined, label: 'Explore', isSelected: _selectedIndex == 1, onTap: () => setState(() => _selectedIndex = 1)),
          _NavItem(icon: Icons.shopping_bag_outlined, label: 'Market', isSelected: _selectedIndex == 2, onTap: () => setState(() => _selectedIndex = 2)),
          _NavItem(icon: Icons.auto_awesome_outlined, label: 'Create', isSelected: _selectedIndex == 3, onTap: () => setState(() => _selectedIndex = 3)),
          GestureDetector(
            onTap: () => setState(() => _selectedIndex = 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _selectedIndex == 4 ? kPrimary : const Color(0xFF64748B),
                      width: 1,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBvQQVDAi_QHZxw0n6CuYYG8Si8ykAJhju6HyMfeYB3hEGfD2QNdNAwKLXO2qNPvl8U_gImyveGP9_ELqhfCZoyATulVmXSwow0q_ZWDbWt5_QrkBrIjkwFGldQHyDxm4LHegmzkdtxQzGoBYUBTbo5d07vnpQAfZyN_O_5oIPh8LcBaRxV95x18vCbi2TlXAMsZpdhL3dJ3uwPvva_eLLGwEA1vdlrNoQQwrmAO2aJmmK4p9SlPcxu_-moeROB12zqdFmw6WIxc1E',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(color: const Color(0xFF1E293B)),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: _selectedIndex == 4 ? FontWeight.w700 : FontWeight.w500,
                    color: _selectedIndex == 4 ? kPrimary : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// Post Card
// ─────────────────────────────────────────
class _PostCard extends StatefulWidget {
  final String username, userRole, avatarUrl, imageUrl, title, description, tags, likes, comments, actionLabel;
  final Color userRoleColor;
  final bool isFollowing, isLiked, isBookmarked;
  final double imageAspectRatio;
  final List<_Badge> badges;
  final IconData actionIcon;

  const _PostCard({
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
  State<_PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<_PostCard> {
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
        color: const Color(0xFF0D1117).withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kBorderDark, width: 1),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserHeader(),
          _buildImageArea(),
          _buildContent(),
        ],
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
              border: Border.all(color: kPrimary, width: 2),
              boxShadow: [BoxShadow(color: kPrimary.withOpacity(0.5), blurRadius: 8)],
            ),
            child: ClipOval(
              child: Image.network(
                widget.avatarUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: const Color(0xFF1E293B)),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.username,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                Text(
                  widget.userRole.toUpperCase(),
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: widget.userRoleColor, letterSpacing: 1),
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
                color: _following ? const Color(0xFF1E293B) : kPrimary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                _following ? 'Following' : 'Follow',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: _following ? Colors.white : kPrimary,
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
            errorBuilder: (_, __, ___) => Container(color: const Color(0xFF1E293B)),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Wrap(
              spacing: 8,
              children: widget.badges.map((b) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: b.isPrimary ? kPrimary.withOpacity(0.85) : Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (b.icon != null) ...[
                        Icon(b.icon, color: Colors.white, size: 13),
                        const SizedBox(width: 4),
                      ],
                      Text(b.text,
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white)),
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
                child: const Icon(Icons.fullscreen_rounded, color: Colors.white, size: 22),
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
                          _liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          color: _liked ? kPrimary : const Color(0xFF64748B),
                          size: 22,
                        ),
                        const SizedBox(width: 5),
                        Text(widget.likes,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: _liked ? kPrimary : const Color(0xFF64748B))),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      const Icon(Icons.chat_bubble_outline_rounded, color: Color(0xFF64748B), size: 20),
                      const SizedBox(width: 5),
                      Text(widget.comments,
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF64748B))),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.send_outlined, color: Color(0xFF64748B), size: 20),
                ],
              ),
              GestureDetector(
                onTap: () => setState(() => _bookmarked = !_bookmarked),
                child: Icon(
                  _bookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                  color: _bookmarked ? kPrimary : const Color(0xFF64748B),
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white, height: 1.2)),
          const SizedBox(height: 6),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8), height: 1.5),
              children: [
                TextSpan(text: '${widget.description} '),
                TextSpan(
                    text: widget.tags,
                    style: const TextStyle(color: kPrimary, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(widget.actionIcon, size: 18),
              label: Text(widget.actionLabel,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// Nav Item
// ─────────────────────────────────────────
class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({required this.icon, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? kPrimary : const Color(0xFF64748B), size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? kPrimary : const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// Models
// ─────────────────────────────────────────
class _StoryUser {
  final String name, imageUrl;
  final bool isActive;
  _StoryUser({required this.name, required this.imageUrl, required this.isActive});
}

class _Badge {
  final String text;
  final IconData? icon;
  final bool isPrimary;
  const _Badge({required this.text, this.icon, this.isPrimary = false});
}