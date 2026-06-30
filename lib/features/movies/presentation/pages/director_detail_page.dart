import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/shows/data/models/show_model.dart';
import '../widgets/person/person_profile_header.dart';
import '../widgets/person/credit_horizontal_list.dart';
import '../widgets/actor_detail/actor_info_row.dart';
import '../widgets/actor_detail/actor_section_header.dart';
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
            originalLanguage: j['original_language'] as String? ?? '',
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
          appBar: AppBar(
            title: Row(
              children: [
                Container(
                  width: 6, height: 24,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(width: 12),
                Text('...', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
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
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 6, height: 24,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 12),
            Text(name, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _fetchData,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            PersonProfileHeader(
                name: name,
                profilePath: profilePath,
                knownFor: knownFor),
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
              CreditHorizontalList(
                  label: t.search.filters.movies,
                  items: _movieCredits),
            if (_tvCredits.isNotEmpty)
              CreditHorizontalList(
                  label: t.search.filters.tv_shows,
                  items: _tvCredits,
                  isTv: true),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
