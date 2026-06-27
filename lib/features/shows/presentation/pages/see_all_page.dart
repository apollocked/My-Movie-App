import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_poster_card.dart';

class ShowSeeAllPage extends StatefulWidget {
  final String title;
  final String endpoint;

  const ShowSeeAllPage({super.key, required this.title, required this.endpoint});

  @override
  State<ShowSeeAllPage> createState() => _ShowSeeAllPageState();
}

class _ShowSeeAllPageState extends State<ShowSeeAllPage> {
  final ApiClient _apiClient = ApiClient();
  final List<Movie> _shows = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchShows();
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

  Future<void> _fetchShows() async {
    setState(() => _isLoading = true);
    try {
      final data = await _apiClient
          .get(widget.endpoint, params: {'page': '1'});
      final results = data['results'] as List? ?? [];
      final shows = _parseShows(results);
      final totalPages = data['total_pages'] as int? ?? 1;
      if (!mounted) return;
      setState(() {
        _shows.clear();
        _shows.addAll(shows);
        _isLoading = false;
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
      final shows = _parseShows(results);
      final totalPages = data['total_pages'] as int? ?? 1;
      if (!mounted) return;
      setState(() {
        _shows.addAll(shows);
        _isLoadingMore = false;
        _hasMore = _currentPage < totalPages;
      });
    } catch (_) {
      _currentPage--;
      if (mounted) setState(() => _isLoadingMore = false);
    }
  }

  List<Movie> _parseShows(List list) {
    return list
          .map((json) => Movie(
                id: (json['id'] as num?)?.toInt() ?? 0,
                title: (json['name'] ?? json['title']) as String? ?? '',
                overview: json['overview'] as String? ?? '',
                posterPath: json['poster_path'] as String? ?? '',
                backdropPath: json['backdrop_path'] as String? ?? '',
                releaseDate: (json['first_air_date'] ?? json['release_date']) as String? ?? '',
                voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
                isShow: true,
              ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: Text(widget.title)),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _shows.length + (_isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= _shows.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                final show = _shows[index];
                return InkWell(
                  onTap: () =>
                      context.push('/show/${show.id}', extra: show),
                  borderRadius: BorderRadius.circular(20),
                  child: MoviePosterCard(movie: show),
                );
              },
            ),
    );
  }
}
