import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayTrailerButton extends StatelessWidget {
  final String? trailerKey;

  const PlayTrailerButton({super.key, this.trailerKey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (trailerKey == null) return;
        final url = Uri.parse('https://www.youtube.com/watch?v=$trailerKey');
        try {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } catch (e) {
          debugPrint('PlayTrailerButton.launchUrl error: $e');
          await launchUrl(url, mode: LaunchMode.platformDefault);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.red.withValues(alpha: 0.25), width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withValues(alpha: 0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.play_arrow_rounded,
                  color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.movie_detail.watch_trailer,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  Text(t.movie_detail.on_youtube,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.6))),
                ],
              ),
            ),
            Icon(Icons.open_in_new_rounded,
                color: Colors.white.withValues(alpha: 0.4), size: 18),
          ],
        ),
      ),
    );
  }
}
