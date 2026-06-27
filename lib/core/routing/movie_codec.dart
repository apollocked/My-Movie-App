import 'dart:convert';
import 'package:my_movie/features/movies/domain/entities/movie.dart';

class MovieCodec extends Codec<Object?, Object?> {
  const MovieCodec();

  @override
  Converter<Object?, Object?> get encoder => const _MovieEncoder();

  @override
  Converter<Object?, Object?> get decoder => const _MovieDecoder();
}

class _MovieEncoder extends Converter<Object?, Object?> {
  const _MovieEncoder();

  @override
  Object? convert(Object? input) {
    if (input is Movie) {
      return {
        'type': 'Movie',
        'id': input.id,
        'title': input.title,
        'overview': input.overview,
        'posterPath': input.posterPath,
        'backdropPath': input.backdropPath,
        'releaseDate': input.releaseDate,
        'voteAverage': input.voteAverage,
      };
    }
    return input;
  }
}

class _MovieDecoder extends Converter<Object?, Object?> {
  const _MovieDecoder();

  @override
  Object? convert(Object? input) {
    if (input is Map<String, dynamic> && (input['type'] == 'Movie' || input['type'] == 'Show')) {
      return Movie(
        id: input['id'] as int,
        title: input['title'] as String,
        overview: input['overview'] as String,
        posterPath: input['posterPath'] as String,
        backdropPath: input['backdropPath'] as String,
        releaseDate: input['releaseDate'] as String,
        voteAverage: (input['voteAverage'] as num).toDouble(),
      );
    }
    return input;
  }
}
