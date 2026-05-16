import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/core/utils/locale_utils.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import 'package:my_movies_app/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movies_app/features/movies/presentation/blocs/settings_cubit/settings_state.dart';
import 'package:my_movies_app/features/movies/presentation/widgets/movie_horizontal_list.dart';
import 'package:my_movies_app/features/movies/presentation/pages/shimmer_pages/movie_shimmer_list.dart';

class CategoryRow extends StatefulWidget {
  final ApiClient apiClient;
  final String title;
  final String endpoint;

  const CategoryRow({
    super.key,
    required this.apiClient,
    required this.title,
    required this.endpoint,
  });

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  List<Movie> _movies = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMovies(context.read<SettingsCubit>().state.locale);
  }

  Future<void> _fetchMovies(Locale locale) async {
    if (!mounted) return;
    setState(() => _isLoading = true);
    try {
      final language = getTmdbLanguageCode(locale);
      final data = await widget.apiClient
          .get(widget.endpoint, params: {'language': language});
      final rawList = data['results'] as List;
      final movies = rawList
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

      if (mounted) {
        setState(() {
          _movies = movies;
          _isLoading = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listenWhen: (previous, current) => previous.locale != current.locale,
      listener: (context, state) {
        _fetchMovies(state.locale);
      },
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_isLoading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(widget.title,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          const MovieShimmerList(cardHeight: 220),
          const SizedBox(height: 24),
        ],
      );
    }

    if (_movies.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        MovieHorizontalList(
          title: widget.title,
          movies: _movies,
          cardHeight: 220,
          onMovieTap: (Movie movie) {
            context.push('/movie/${movie.id}', extra: movie);
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
