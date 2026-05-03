import 'package:flutter/material.dart';
import '../../../../constats/app_colors.dart';

class ProfileTabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  const ProfileTabs({
    super.key,
    required this.tabs,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF140E24),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: List.generate(
          tabs.length,
          (i) => Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient: selectedTab == i ? AppColors.primaryGradient : null,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: selectedTab == i
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 10,
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    tabs[i],
                    style: TextStyle(
                      color: selectedTab == i ? Colors.white : Colors.white30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
