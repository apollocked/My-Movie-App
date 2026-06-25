import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import '../widgets/movie_poster_card.dart';

class ActorDetailPage extends StatefulWidget {
  final int personId;
  final Map<String, dynamic>? data;

  const ActorDetailPage({super.key, required this.personId, this.data});

  @override
  State<ActorDetailPage> createState() => _ActorDetailPageState();
}

class _ActorDetailPageState extends State<ActorDetailPage> {
  final ApiClient _apiClient = ApiClient();
  Map<String, dynamic>? _person;
  List<Movie> _filmography = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final person = await _apiClient.get('/person/${widget.personId}',
          params: {'append_to_response': 'movie_credits'});
      final credits = person['movie_credits'] as Map<String, dynamic>?;
      final castList = credits?['cast'] as List? ?? [];

      final films = castList
          .map((json) => Movie(
                id: (json['id'] as num?)?.toInt() ?? 0,
                title: json['title'] as String? ?? '',
                overview: json['overview'] as String? ?? '',
                posterPath: json['poster_path'] as String? ?? '',
                backdropPath: json['backdrop_path'] as String? ?? '',
                releaseDate: json['release_date'] as String? ?? '',
                voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
              ))
          .toList();
      films.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));

      if (!mounted) return;
      setState(() {
        _person = person;
        _filmography = films;
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final name = _person?['name'] as String? ??
        widget.data?['name'] as String? ??
        '';
    final profilePath = _person?['profile_path'] as String? ??
        widget.data?['profilePath'] as String? ??
        '';
    final biography = _person?['biography'] as String? ?? '';
    final knownFor = _person?['known_for_department'] as String? ?? '';
    final birthDay = _person?['birthday'] as String? ?? '';
    final placeOfBirth = _person?['place_of_birth'] as String? ?? '';

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: Text(name)),
      body: RefreshIndicator(
        onRefresh: _fetchData,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: profilePath.isNotEmpty
                    ? NetworkImage(
                        'https://image.tmdb.org/t/p/w185$profilePath')
                    : null,
                child: profilePath.isEmpty
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            Text(name,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            if (knownFor.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(knownFor,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.hintColor)),
            ],
            if (birthDay.isNotEmpty || placeOfBirth.isNotEmpty) ...[
              const SizedBox(height: 16),
              if (birthDay.isNotEmpty)
                _infoRow(Icons.cake_outlined, 'Born: $birthDay', theme),
              if (placeOfBirth.isNotEmpty)
                _infoRow(Icons.location_on_outlined, placeOfBirth, theme),
            ],
            if (biography.isNotEmpty) ...[
              const SizedBox(height: 24),
              Text('Biography',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(biography,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(height: 1.6, color: theme.hintColor)),
            ],
            if (_filmography.isNotEmpty) ...[
              const SizedBox(height: 24),
              Text('Filmography (${_filmography.length})',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filmography.length,
                  itemBuilder: (context, index) {
                    final movie = _filmography[index];
                    return GestureDetector(
                      onTap: () => context.push('/movie/${movie.id}', extra: movie),
                      child: SizedBox(
                        width: 130,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              Expanded(
                                child: MoviePosterCard(
                                    height: 200, movie: movie),
                              ),
                              const SizedBox(height: 4),
                              Text(movie.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 11)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: theme.hintColor),
          const SizedBox(width: 6),
          Text(text, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
