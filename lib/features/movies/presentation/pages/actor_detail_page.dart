import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/theme/app_colors.dart';
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
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: theme.dividerColor.withValues(alpha: 0.5),
                      width: 2),
                ),
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: theme.cardColor,
                  backgroundImage: profilePath.isNotEmpty
                      ? NetworkImage(
                          'https://image.tmdb.org/t/p/w185$profilePath')
                      : null,
                  child: profilePath.isEmpty
                      ? Icon(Icons.person_rounded, size: 46, color: theme.hintColor)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(name,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w800)),
            if (knownFor.isNotEmpty) ...[
              const SizedBox(height: 6),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(knownFor,
                    style: TextStyle(
                        color: theme.colorScheme.secondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
              ),
            ],
            if (birthDay.isNotEmpty || placeOfBirth.isNotEmpty) ...[
              const SizedBox(height: 20),
              if (birthDay.isNotEmpty)
                _infoRow(Icons.cake_outlined, 'Born: $birthDay', theme),
              if (placeOfBirth.isNotEmpty)
                const SizedBox(height: 6),
              if (placeOfBirth.isNotEmpty)
                _infoRow(
                    Icons.location_on_outlined, placeOfBirth, theme),
            ],
            if (biography.isNotEmpty) ...[
              const SizedBox(height: 28),
              _sectionHeader(theme, 'Biography'),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: theme.dividerColor.withValues(alpha: 0.3)),
                ),
                child: Text(biography,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(height: 1.7, color: theme.hintColor)),
              ),
            ],
            if (_filmography.isNotEmpty) ...[
              const SizedBox(height: 28),
              _sectionHeader(theme, 'Filmography (${_filmography.length})'),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filmography.length,
                  itemBuilder: (context, index) {
                    final movie = _filmography[index];
                    return GestureDetector(
                      onTap: () => context.push(
                          '/movie/${movie.id}', extra: movie),
                      child: SizedBox(
                        width: 130,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: Column(
                            children: [
                              Expanded(
                                child: MoviePosterCard(
                                    height: 200, movie: movie),
                              ),
                              const SizedBox(height: 6),
                              Text(movie.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500)),
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

  Widget _sectionHeader(ThemeData theme, String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(title,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _infoRow(IconData icon, String text, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: AppColors.textTertiaryDark),
        const SizedBox(width: 6),
        Text(text, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
