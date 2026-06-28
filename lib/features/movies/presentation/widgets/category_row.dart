import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/locale_utils.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_state.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_horizontal_list.dart';
import 'package:my_movie/features/movies/presentation/pages/shimmer_pages/movie_shimmer_list.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';

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
      final isTvEndpoint = widget.endpoint.startsWith('/tv/') || widget.endpoint.startsWith('/discover/tv');
      final movies = rawList
          .map((json) => Movie(
                id: (json['id'] as num?)?.toInt() ?? 0,
                title: (json['title'] ?? json['name']) as String? ?? '',
                overview: json['overview'] as String? ?? '',
                posterPath: json['poster_path'] as String? ?? '',
                backdropPath: json['backdrop_path'] as String? ?? '',
                releaseDate: (json['release_date'] ?? json['first_air_date']) as String? ?? '',
                voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
                isShow: isTvEndpoint,
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
    final theme = Theme.of(context);

    if (_isLoading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(theme, 0),
          const MovieShimmerList(cardHeight: 220),
          const SizedBox(height: 24),
        ],
      );
    }

    if (_movies.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        _buildHeader(theme, 1),
        MovieHorizontalList(
          movies: _movies,
          cardHeight: 220,
          onMovieTap: (Movie movie) {
            final isMovies = context.read<ContentTypeCubit>().state == ContentType.movies;
            if (isMovies) {
              context.push('/movie/${movie.id}', extra: movie);
            } else {
              context.push('/show/${movie.id}', extra: movie);
            }
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildHeader(ThemeData theme, int variant) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 22,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Text(widget.title,
                  style: theme.textTheme.titleLarge),
            ],
          ),
          AnimatedButton.text(
            text: t.common.see_all,
            onPressed: () {
              final encoded = Uri.encodeComponent(widget.endpoint);
              final isMovies = context.read<ContentTypeCubit>().state == ContentType.movies;
              if (isMovies) {
                context.push('/see-all/$encoded', extra: widget.title);
              } else {
                context.push('/see-all-shows/$encoded', extra: widget.title);
              }
            },
            foregroundColor: theme.primaryColor,
            icon: Icons.arrow_forward_ios_rounded,
          ),
        ],
      ),
    );
  }
}
