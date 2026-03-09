import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../constats/app_colors.dart';
import 'models/social_models.dart';
import 'widgets/social_header.dart';
import 'widgets/story_bar.dart';
import 'widgets/post_card.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  final List<StoryUser> _stories = [
    StoryUser(
      name: 'NeoDev',
      isActive: true,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuABuBnlMYS9Nkn4O6K0c_GdgiCkG2LpGC1qWoQuHuN_7Ek_6DKfyQ9vVFuvGADmdDBBn0eH7N_BIKJBiPqqcCNUW4vXhPuFgTT88C1amHHsqdmiX5c3DXaV3IEnjolOyzbiw7_7f9hm7kRQzcjb-MBhtSYUeYPq4VzKl92GBbFHGppKwZKideAhcAvg57RM1iK2UBKzd0uYRm5MAP-jKlTYefgwmbuTo-HDWNFaKudeciAVgbutR8NlP1ePcDYzNYK7iMWP51oaH6U',
    ),
    StoryUser(
      name: 'Lumina3D',
      isActive: true,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAy7NrIkpbi8hWLd3HErB-OAKaq_l3oPI6wtziFnPhYRwuBclYwsVwsogEddScrlEyB1eGNll6k09nCbWrmExeF5JFTTJlCIvStZRMAtCrOkiuNPmUKTr1s6AVTocuoxPbQeFQEN4aa2_GvHfreOIVlWjQ8doE2r5e-xwGvMNZXmr1IYPGfLVTTTSCysoer9P4CVou9WqXsbYRoWFJS4XbdaLxIRKwq7Y3zlV3mTKn8DSNoF0cGTg2aLF3WXS__4EYqTCJ0Onzkcvs',
    ),
    StoryUser(
      name: 'VoxelArt',
      isActive: false,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBkflzOJpWwS0BiTm4ZXJHR1zRfzfUTT_RUR-oycwcfQq5VCL8vsJwl7ck9aYLtpft9KefDMfPXY0EVZTP_OdEdkhoFkkBoSXR4kaCTetinGN1opcZkq4rcElk5R-bt9np2nsm-byOOfhx64CGtVXD_MTvCdYaRZauUcvGhJTyJmNrc5_jXpVcMH2KGKqAtTQjHkI7Ss0hXe8SATFgg5C4ZOh9M15SKRDRR5y7SNlBXUxUGlL-E2wUrOCB9_Y5tuOUrZcEvJAaM8WY',
    ),
    StoryUser(
      name: 'MechaSoul',
      isActive: true,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAG1l4mxtqin0VtY15-gihEHwV-20JM6hmIBsRsLIjRBqjnY6zS310Yvav7P1hUgN6ez6zJ9-gwGyROOHPi8UqZuh2YK6sxlMneigOfsww2DbcyWjqP9KDGc1cEF65AORlDAGML6H3crSVFtHHjVIkNqmpirkN58lpFJmqVwi4obZCRfabUJDXICBeU_EWpLFChJA1lQLJTMgeP-bejgZX-hdfDgeHEZ96qefztDpIthASYyAnCm3zhTicM_FievBics368dJBkqUw',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SocialHeader()),
          SliverToBoxAdapter(child: StoryBar(stories: _stories)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildPost1(),
                const SizedBox(height: 24),
                _buildPost2(),
                const SizedBox(height: 130), // Extra padding for floating bar
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPost1() {
    return const PostCard(
      username: 'NeoDesigner',
      userRole: 'Master Creator',
      userRoleColor: AppColors.secondary,
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuC3mT6OyDsHM1u3NpIXy29EIWVcQKTfu3v9RkHCmO_mb88nRCdl8zFF9bFE63_NHodtHZwDq2f6DgDUxEV9YcW_CcQ5XUR6JqioxjYv3jeYSwLQsLJ1WB7VqUQX6mlcaQuuL8iCAvi3KYRHngSaHcCXdw_2nmERLLxV_OFOB6q5aDS1A-B568Qq1h5-7nlUHVp80HLPka4zdy1ksFVxGkXtrel4rqs6WD_igar1-uUc5pNGyS-02-5B2Uj3b8JfVuJ_o492CDq810w',
      isFollowing: false,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDJjcYvUech4cA9DnXYUQHOm2J3CDTL3N1OEob6rnW0UXMUmAxf1piq6SlN0BvyXfT1NLclYGrA4qh6N5yYdFS-oynhCknIMr4jOE6zMm2b4A57WM7ltLdUX0rdhVqDABQH8_ux09gB2LPcKSwxOI_ao0UmC1crHEP9Yv_jdfAjZy2BjQm4hx6EGzMjKWJqwjMEOii2Y9-MAStjBzMaKltpPDSGCB3-4UGoxD-FJJ3mwBe6c9APjAioTL2okVdZtWtCTnehbff-tsY',
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
    );
  }

  Widget _buildPost2() {
    return const PostCard(
      username: 'Lumina3D',
      userRole: 'In-Studio',
      userRoleColor: Color(0xFF10B981),
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAVRndwKLktC1twcuRKkL8pJJIxa0pSYOFUIiIH0XhxUFYSPlqFAXhlFtqa3sBMtN8KpyGKdorXsGwtc5nlsj58xv_XeFwzKD7h7388npsPbb1xnaSvrtED-eJzH0zLOJqsEC662IFlaQEzGGa0EOdM-1J99bV6fmfs2HOX40Vwa6KJdt7oTYraCu5t7U_aS5exrzQCV9DKsMTfpt56arg49m6MZDmwHgNT04I7WMr1WPgVjj42mc0DN0GayQZTexHFfdjWPIstkCk',
      isFollowing: true,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBxNC6reEt0Q7D3_h7myE8i8SDQwPeeOO_GhzVEy2MZYBAxBLtM-bZNdysTozeGcHxxEyrt5hHRViWkwVv7JfD8pGssexeoPKGKQTV1aIWS7BCfnbhRNt_hFIRepL2xiMKhJz1HtRqgKCz2XGkjdzLCFFQeg9Yea7oN9LQ4IYVCPb43OXOrcy1KiGlMe9JOCa5m5ULdLmME8D2gGobkYgtxIMYfHUZQ-KX90VCSrz6lPKNWhhXHfU-n_4I8Ca94bsdZnTzYRsHetz0',
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
    );
  }
}
