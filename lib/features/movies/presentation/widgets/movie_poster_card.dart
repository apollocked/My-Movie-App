import 'package:flutter/material.dart';

class MoviePosterCard extends StatelessWidget {
  final double height;

  const MoviePosterCard({super.key, this.height = 260});

  @override
  Widget build(BuildContext context) {
    final width = height * 0.68;
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: Colors.white.withValues(alpha: 0.08), width: 1),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 6)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500',
              fit: BoxFit.cover,
            ),
          ),
          _buildRatingBadge(),
        ],
      ),
    );
  }

  Widget _buildRatingBadge() {
    return Positioned(
      top: 12,
      right: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.65),
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: Colors.white.withValues(alpha: 0.12), width: 1),
        ),
        child: const Row(
          children: [
            Icon(Icons.star_rounded, color: Color(0xFFD4AF37), size: 14),
            SizedBox(width: 2),
            Text('8.4',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
