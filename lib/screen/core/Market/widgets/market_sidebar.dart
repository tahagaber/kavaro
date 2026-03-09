import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarketSidebar extends StatelessWidget {
  const MarketSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF9824FF);
    const bgColor = Color(0xFF130B1E);

    return Drawer(
      backgroundColor: bgColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const Icon(Icons.category, color: primaryColor, size: 28),
                  const SizedBox(width: 12),
                  Text(
                    'Categories',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white10, height: 1),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  _buildCategoryItem(Icons.sports_esports, 'Gaming', true),
                  _buildCategoryItem(Icons.movie_filter, 'Anime', false),
                  _buildCategoryItem(Icons.architecture, 'Architecture', false),
                  _buildCategoryItem(Icons.directions_car, 'Vehicles', false),
                  _buildCategoryItem(Icons.person, 'Characters', false),
                  _buildCategoryItem(Icons.park, 'Environments', false),
                  _buildCategoryItem(Icons.brush, 'Materials', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String title, bool isSelected) {
    const primaryColor = Color(0xFF9824FF);
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? primaryColor : Colors.grey.shade400,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey.shade400,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
      onTap: () {
        // Handle category selection
      },
      selected: isSelected,
      selectedTileColor: primaryColor.withOpacity(0.1),
    );
  }
}
