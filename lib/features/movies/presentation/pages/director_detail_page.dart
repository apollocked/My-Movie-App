import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/shows/data/models/show_model.dart';
import '../widgets/movie_poster_card.dart';
import '../widgets/actor_detail/actor_section_header.dart';
import '../widgets/actor_detail/actor_info_row.dart';
import '../widgets/actor_detail/actor_biography_card.dart';

class DirectorDetailPage extends StatefulWidget {
  final int personId;
  final Map<String, dynamic>? data;

  const DirectorDetailPage({super.key, required this.personId, this.data});

  @override
  State<DirectorDetailPage> createState() => _DirectorDetailPageState();
}

class _DirectorDetailPageState extends State<DirectorDetailPage> {
  final ApiClient _apiClient = ApiClient();
  Map<String, dynamic>? _person;
  List<Movie> _movieCredits = [];
  List<Movie> _tvCredits = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final person = await _apiClient.get('/person/${widget.personId}',
          params: {'append_to_response': 'movie_credits,tv_credits'});

      final movieCrew = (person['movie_credits'] as Map<String, dynamic>?)?['crew'] as List? ?? [];
      final tvCrew = (person['tv_credits'] as Map<String, dynamic>?)?['crew'] as List? ?? [];

      final movies = movieCrew
          .where((c) => c['job'] == 'Director')
          .map((j) => Movie(
            id: (j['id'] as num?)?.toInt() ?? 0,
            title: j['title'] as String? ?? '',
            overview: j['overview'] as String? ?? '',
            posterPath: j['poster_path'] as String? ?? '',
            backdropPath: j['backdrop_path'] as String? ?? '',
            releaseDate: j['release_date'] as String? ?? '',
            voteAverage: (j['vote_average'] as num?)?.toDouble() ?? 0.0,
          ))
          .toList();

      final tvShows = tvCrew
          .where((c) => c['job'] == 'Director')
          .map((j) => ShowModel.fromJson(j as Map<String, dynamic>).toMovie())
          .toList();

      movies.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
      tvShows.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));

      if (!mounted) return;
      setState(() {
        _person = person;
        _movieCredits = movies;
        _tvCredits = tvShows;
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
          body: const Center(child: CircularProgressIndicator()));
    }

    final name = _person?['name'] as String? ?? widget.data?['name'] as String? ?? '';
    final profilePath = _person?['profile_path'] as String? ??
        widget.data?['profilePath'] as String? ?? '';
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
                    ? Icon(Icons.person_rounded,
                        size: 46, color: theme.hintColor)
                    : null,
              ),
            )),
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
                ActorInfoRow(
                    icon: Icons.cake_outlined,
                    text: '${t.director.born} $birthDay'),
              if (placeOfBirth.isNotEmpty) const SizedBox(height: 6),
              if (placeOfBirth.isNotEmpty)
                ActorInfoRow(
                    icon: Icons.location_on_outlined, text: placeOfBirth),
            ],
            if (biography.isNotEmpty) ...[
              const SizedBox(height: 28),
              ActorSectionHeader(title: t.director.biography),
              const SizedBox(height: 12),
              ActorBiographyCard(biography: biography),
            ],
            if (_movieCredits.isNotEmpty)
              ..._buildCreditSection(theme, t.search.filters.movies, _movieCredits, false),
            if (_tvCredits.isNotEmpty)
              ..._buildCreditSection(theme, t.search.filters.tv_shows, _tvCredits, true),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCreditSection(ThemeData theme, String label, List<Movie> items, bool isTv) {
    return [
      const SizedBox(height: 28),
      ActorSectionHeader(title: '$label (${items.length})'),
      const SizedBox(height: 16),
      SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final movie = items[index];
            return GestureDetector(
              onTap: () {
                if (isTv) {
                  context.push('/show/${movie.id}', extra: movie);
                } else {
                  context.push('/movie/${movie.id}', extra: movie);
                }
              },
              child: SizedBox(
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Column(children: [
                    Expanded(child: MoviePosterCard(height: 200, movie: movie)),
                    const SizedBox(height: 6),
                    Text(movie.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                  ]),
                ),
              ),
            );
          },
        ),
      ),
    ];
  }
}
