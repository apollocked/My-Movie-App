import 'package:flutter/material.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import '../widgets/collection_grid.dart';
import '../widgets/collection_empty_state.dart';

class CollectionPage extends StatelessWidget {
  final String title;
  final String collectionPath;

  const CollectionPage(
      {super.key, required this.title, required this.collectionPath});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final service = CollectionService();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 6,
              height: 22,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 12),
            Text(title,
                style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<List<Movie>>(
        stream: service.watchCollection(collectionPath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  '${t.common.error_title}:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.error),
                ),
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const CollectionEmptyState();
          }
          return CollectionGrid(
              movies: snapshot.data!,
              collectionPath: collectionPath,
              isRatings: collectionPath == 'ratings');
        },
      ),
    );
  }
}
