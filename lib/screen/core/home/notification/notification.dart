import 'package:flutter/material.dart';
import '../../../../constats/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          _sectionTitle('Today'),
          _notificationItem(
            icon: Icons.qr_code_scanner_rounded,
            color: AppColors.primary,
            title: 'Scan Successful',
            desc: 'Your 3D scan of "Cyber Helmet" is ready for review.',
            time: '2h ago',
            isNew: true,
          ),
          _notificationItem(
            icon: Icons.shopping_bag_outlined,
            color: AppColors.secondary,
            title: 'New Purchase',
            desc: 'Someone just bought your "Titan Gear" model!',
            time: '5h ago',
            isNew: true,
          ),
          const SizedBox(height: 20),
          _sectionTitle('Yesterday'),
          _notificationItem(
            icon: Icons.favorite_border_rounded,
            color: Colors.pinkAccent,
            title: 'New Like',
            desc: 'Alex and 12 others liked your recent post.',
            time: '1d ago',
            isNew: false,
          ),
          _notificationItem(
            icon: Icons.person_add_alt_1_outlined,
            color: Colors.orangeAccent,
            title: 'New Follower',
            desc: 'NeonDesigner started following you.',
            time: '1d ago',
            isNew: false,
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 8),
        child: Text(
          title,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      );

  Widget _notificationItem({
    required IconData icon,
    required Color color,
    required String title,
    required String desc,
    required String time,
    required bool isNew,
  }) =>
      Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isNew ? color.withOpacity(0.08) : const Color(0xFF140E24),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isNew ? color.withOpacity(0.3) : Colors.white.withOpacity(0.05)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: color.withOpacity(0.15), shape: BoxShape.circle),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(time, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
