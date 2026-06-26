import 'package:flutter/material.dart';

class TrailerFallback extends StatelessWidget {
  final String posterUrl;

  const TrailerFallback({super.key, required this.posterUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      posterUrl,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(color: Colors.black),
    );
  }
}
