import 'package:flutter/material.dart';

class SocialBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;
  final Color backgroundColor;
  final Color borderColor;
  final Color activeColor;
  final String profileImageUrl;

  const SocialBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
    required this.backgroundColor,
    required this.borderColor,
    required this.activeColor,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.85),
        border: Border(top: BorderSide(color: borderColor, width: 1)),
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
          _NavItem(
            icon: Icons.home_rounded,
            label: 'Home',
            isSelected: selectedIndex == 0,
            onTap: () => onTabChange(0),
            activeColor: activeColor,
          ),
          _NavItem(
            icon: Icons.explore_outlined,
            label: 'Explore',
            isSelected: selectedIndex == 1,
            onTap: () => onTabChange(1),
            activeColor: activeColor,
          ),
          _NavItem(
            icon: Icons.shopping_bag_outlined,
            label: 'Market',
            isSelected: selectedIndex == 2,
            onTap: () => onTabChange(2),
            activeColor: activeColor,
          ),
          _NavItem(
            icon: Icons.auto_awesome_outlined,
            label: 'Create',
            isSelected: selectedIndex == 3,
            onTap: () => onTabChange(3),
            activeColor: activeColor,
          ),
          GestureDetector(
            onTap: () => onTabChange(4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedIndex == 4
                          ? activeColor
                          : const Color(0xFF64748B),
                      width: 1,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      profileImageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Container(color: const Color(0xFF1E293B)),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight:
                        selectedIndex == 4 ? FontWeight.w700 : FontWeight.w500,
                    color:
                        selectedIndex == 4 ? activeColor : const Color(0xFF64748B),
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

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color activeColor;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: isSelected ? activeColor : const Color(0xFF64748B),
              size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? activeColor : const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}
