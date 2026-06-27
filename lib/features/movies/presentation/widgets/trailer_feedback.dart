import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrailerFallback extends StatelessWidget {
  final String imageUrl;

  const TrailerFallback({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (_, __) => Container(
        color: isDark ? const Color(0xFF1A1A2E) : const Color(0xFFF8F9FA),
      ),
      errorWidget: (_, __, ___) => Container(color: Colors.black),
    );
  }
}
