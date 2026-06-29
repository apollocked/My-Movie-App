import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';

class RecommendationFilter {
  final List<int> genreIds;
  final double minRating;
  final double? maxRating;
  final int yearFrom;
  final int? yearTo;
  final String sortBy;
  final int minVotes;
  final bool isShuffled;
  final ContentType contentType;
  final String? certificationCountry;
  final String? certificationMax;

  const RecommendationFilter({
    this.genreIds = const [],
    this.minRating = 0.0,
    this.maxRating,
    this.yearFrom = 1900,
    this.yearTo,
    this.sortBy = 'popularity.desc',
    this.minVotes = 50,
    this.isShuffled = true,
    this.contentType = ContentType.movies,
    this.certificationCountry,
    this.certificationMax,
  });

  bool get isForShows => contentType == ContentType.shows;

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
    final mr = maxRating;
    if (mr != null && mr < 10.0) {
      params['vote_average.lte'] = mr;
    }
    if (yearFrom > 1900) {
      params[isForShows ? 'first_air_date.gte' : 'primary_release_date.gte'] =
          '$yearFrom-01-01';
    }
    if (yearTo != null) {
      params[isForShows ? 'first_air_date.lte' : 'primary_release_date.lte'] =
          '$yearTo-12-31';
    }

    final cert = certificationMax;
    if (cert != null && cert.isNotEmpty) {
      params['certification_country'] =
          certificationCountry ?? 'US';
      params['certification.lte'] = cert;
      params['include_adult'] = false;
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
    bool? isShuffled,
    ContentType? contentType,
    String? certificationCountry,
    String? certificationMax,
  }) {
    return RecommendationFilter(
      genreIds: genreIds ?? this.genreIds,
      minRating: minRating ?? this.minRating,
      maxRating: maxRating ?? this.maxRating,
      yearFrom: yearFrom ?? this.yearFrom,
      yearTo: yearTo ?? this.yearTo,
      sortBy: sortBy ?? this.sortBy,
      minVotes: minVotes ?? this.minVotes,
      isShuffled: isShuffled ?? this.isShuffled,
      contentType: contentType ?? this.contentType,
      certificationCountry: certificationCountry ?? this.certificationCountry,
      certificationMax: certificationMax ?? this.certificationMax,
    );
  }
}
