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
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFF2D2540), width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              // Full background image
              Hero(
                tag: 'product-$title-$image',
                child: SizedBox.expand(
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
              ),

              // Shadow/Gradient Overlay
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.1),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: const Alignment(0, -0.2),
                    ),
                  ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badge
                    Container(
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
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            blurRadius: 10,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Author
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
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
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
      ),
    );
  }
}
