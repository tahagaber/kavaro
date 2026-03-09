import 'package:flutter/material.dart';
import 'package:kavaro/models/market_model.dart';
import '../../../product/product_detail_screen.dart';

class HomeTrendingSection extends StatelessWidget {
  const HomeTrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Trending Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'See all',
                style: TextStyle(
                  color: Color(0xFF8B5CF6),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildTrendingCard(
                context: context,
                image: MarketModel.cyberRoninUrl,
                badge: 'NEW DROP',
                badgeColor: const Color(0xFF8B5CF6),
                title: 'Cyber-Ronin MK II',
                author: 'NeuralForge',
                authorColor: const Color(0xFF4ADE80),
                price: 55.00,
              ),
              const SizedBox(width: 16),
              _buildTrendingCard(
                context: context,
                image: MarketModel.vortexUrl,
                badge: 'POPULAR',
                badgeColor: const Color(0xFF6B7280),
                title: 'Vortex X9',
                author: 'K Studios',
                authorColor: Colors.white70,
                price: 32.00,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingCard({
    required BuildContext context,
    required String image,
    required String badge,
    required Color badgeColor,
    required String title,
    required String author,
    required Color authorColor,
    required double price,
  }) {
    final Map<String, dynamic> projectData = {
      'name': title,
      'image': image,
      'price': price,
      'rating': 4.9,
      'reviews': 85,
    };

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: projectData),
          ),
        );
      },
      child: Container(
        width: 230,
        decoration: BoxDecoration(
          color: const Color(0xFF13101E),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF2D2540), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: 'product-$title-$image',
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: const Color(0xFF1A1527),
                          child: const Icon(
                            Icons.view_in_ar_rounded,
                            color: Color(0xFF8B5CF6),
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: badgeColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          badge,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: authorColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'by $author',
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
