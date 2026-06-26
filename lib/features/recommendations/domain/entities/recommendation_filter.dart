class RecommendationFilter {
  final List<int> genreIds;
  final double minRating;
  final double? maxRating;
  final int yearFrom;
  final int? yearTo;
  final String sortBy;
  final int minVotes;

  const RecommendationFilter({
    this.genreIds = const [],
    this.minRating = 0.0,
    this.maxRating,
    this.yearFrom = 1900,
    this.yearTo,
    this.sortBy = 'popularity.desc',
    this.minVotes = 50,
  });

  Map<String, dynamic> toQueryParams(String language) {
    final params = <String, dynamic>{
      'language': language,
      'sort_by': sortBy,
      'vote_count.gte': minVotes,
      'page': 1,
    };

    if (genreIds.isNotEmpty) {
      params['with_genres'] = genreIds.join(',');
    }
    if (minRating > 0) {
      params['vote_average.gte'] = minRating;
    }
    if (maxRating != null) {
      params['vote_average.lte'] = maxRating;
    }
    if (yearFrom > 1900) {
      params['primary_release_date.gte'] = '$yearFrom-01-01';
    }
    if (yearTo != null) {
      params['primary_release_date.lte'] = '$yearTo-12-31';
    }

    return params;
  }

  RecommendationFilter copyWith({
    List<int>? genreIds,
    double? minRating,
    double? maxRating,
    int? yearFrom,
    int? yearTo,
    String? sortBy,
    int? minVotes,
  }) {
    return RecommendationFilter(
      genreIds: genreIds ?? this.genreIds,
      minRating: minRating ?? this.minRating,
      maxRating: maxRating ?? this.maxRating,
      yearFrom: yearFrom ?? this.yearFrom,
      yearTo: yearTo ?? this.yearTo,
      sortBy: sortBy ?? this.sortBy,
      minVotes: minVotes ?? this.minVotes,
    );
  }
}
