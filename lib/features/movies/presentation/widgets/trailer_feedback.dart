import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrailerFallback extends StatelessWidget {
  final String posterUrl;
  final String? trailerKey;

  const TrailerFallback({super.key, required this.posterUrl, this.trailerKey});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          posterUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(color: Colors.black),
        ),
        if (trailerKey != null)
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.play_circle_fill),
              label: const Text('Watch Trailer on YouTube'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                final url = Uri.parse(
                  'https://www.youtube.com/watch?v=$trailerKey',
                );
                try {
                  await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                } catch (_) {
                  await launchUrl(
                    url,
                    mode: LaunchMode.platformDefault,
                  );
                }
              },
            ),
          ),
      ],
    );
  }
}
