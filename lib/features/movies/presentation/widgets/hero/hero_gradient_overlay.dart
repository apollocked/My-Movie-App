import 'package:flutter/material.dart';

class HeroGradientOverlay extends StatelessWidget {
  const HeroGradientOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Color(0xB007090F),
              Color(0xFF07090F),
            ],
            stops: [0.0, 0.3, 0.75, 1.0]),
      ),
    );
  }
}
