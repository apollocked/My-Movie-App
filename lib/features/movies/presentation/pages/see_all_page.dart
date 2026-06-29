import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/responsive.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import '../widgets/movie_poster_card.dart';

class SeeAllPage extends StatefulWidget {
  final String title;
  final String endpoint;

  const SeeAllPage({super.key, required this.title, required this.endpoint});

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  final ApiClient _apiClient = ApiClient();
  final List<Movie> _movies = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _currentPage = 1;

  bool get _isTvEndpoint =>
      widget.endpoint.startsWith('/tv/') ||
      widget.endpoint.startsWith('/discover/tv');

  @override
  void initState() {
    super.initState();
    _currentPage = 1;
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        _hasMore) {
      _loadMore();
    }
  }

  Future<void> _fetchMovies() async {
    setState(() => _isLoading = true);
    try {
      final data = await _apiClient
          .get(widget.endpoint, params: {'page': '1'});
      final results = data['results'] as List? ?? [];
      final movies = _parseMovies(results);
      final totalPages = data['total_pages'] as int? ?? 1;
      if (!mounted) return;
      setState(() {
        _movies.clear();
        _movies.addAll(movies);
        _isLoading = false;
        _currentPage = 1;
        _hasMore = _currentPage < totalPages;
      });
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _loadMore() async {
    setState(() => _isLoadingMore = true);
    _currentPage++;
    try {
      final data = await _apiClient
          .get(widget.endpoint, params: {'page': '$_currentPage'});
      final results = data['results'] as List? ?? [];
      final movies = _parseMovies(results);
      final totalPages = data['total_pages'] as int? ?? 1;
      if (!mounted) return;
      setState(() {
        _movies.addAll(movies);
        _isLoadingMore = false;
        _hasMore = _currentPage < totalPages;
      });
    } catch (_) {
      _currentPage--;
      if (mounted) setState(() => _isLoadingMore = false);
    }
  }

  List<Movie> _parseMovies(List list) {
    return list
        .map((json) => Movie(
              id: (json['id'] as num?)?.toInt() ?? 0,
              title: (json['title'] ?? json['name']) as String? ?? '',
              overview: json['overview'] as String? ?? '',
              posterPath: json['poster_path'] as String? ?? '',
              backdropPath: json['backdrop_path'] as String? ?? '',
              releaseDate: (json['release_date'] ?? json['first_air_date']) as String? ?? '',
              voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
              isShow: _isTvEndpoint,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
            Text(widget.title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppSizing.gridColumns(context, mobile: 2, tablet: 3, desktop: 4).toInt(),
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _movies.length + (_isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= _movies.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                final movie = _movies[index];
                final route = movie.isShow ? '/show' : '/movie';
                return InkWell(
                  onTap: () =>
                      context.push('$route/${movie.id}', extra: movie),
                  borderRadius: BorderRadius.circular(20),
                  child: MoviePosterCard(movie: movie),
                );
              },
            ),
    );
  }
}
