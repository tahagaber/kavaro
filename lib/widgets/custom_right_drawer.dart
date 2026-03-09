import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kavaro/constats/app_colors.dart';

class CustomRightDrawer extends StatelessWidget {
  const CustomRightDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundDark,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: AppColors.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.2),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.category_rounded,
                        color: AppColors.primary,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Categories',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryItem(context, 'Anime', Icons.brush_rounded),
                  _buildCategoryItem(
                    context,
                    'Gaming',
                    Icons.sports_esports_rounded,
                  ),
                  _buildCategoryItem(context, 'Tech', Icons.memory_rounded),
                  _buildCategoryItem(
                    context,
                    'Collectibles',
                    Icons.auto_awesome_rounded,
                  ),
                  _buildCategoryItem(
                    context,
                    'Characters',
                    Icons.person_rounded,
                  ),
                  _buildCategoryItem(
                    context,
                    'Vehicles',
                    Icons.directions_car_rounded,
                  ),
                  const Divider(color: Colors.white12, height: 32),
                  _buildCategoryItem(
                    context,
                    'Best Sellers',
                    Icons.local_fire_department_rounded,
                  ),
                  _buildCategoryItem(
                    context,
                    'New Arrivals',
                    Icons.new_releases_rounded,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Kavaro v1.0.0',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.3),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.03),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary, size: 22),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right_rounded,
          color: Colors.white.withOpacity(0.3),
          size: 18,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
