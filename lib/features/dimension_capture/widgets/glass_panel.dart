import 'dart:ui';
import 'package:flutter/material.dart';

class GlassPanel extends StatelessWidget {
  final double width;
  final double height;
  final double depth;

  const GlassPanel({
    Key? key,
    required this.width,
    required this.height,
    required this.depth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00E5FF).withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: -5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDimensionItem(
                'W',
                width.toStringAsFixed(1),
                const Color(0xFF00E5FF),
              ),
              _buildDivider(),
              _buildDimensionItem(
                'H',
                height.toStringAsFixed(1),
                const Color(0xFF00E5FF),
              ),
              _buildDivider(),
              _buildDimensionItem(
                'D',
                depth.toStringAsFixed(1),
                const Color(0xFFB000FF),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDimensionItem(String label, String value, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(color: color.withOpacity(0.5), blurRadius: 10),
                ],
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'mm',
              style: TextStyle(color: color.withOpacity(0.5), fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.white.withOpacity(0.2),
    );
  }
}
