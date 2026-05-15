import 'package:isar/isar.dart';

part 'cached_movie.g.dart';

@collection
class CachedMovie {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int movieId;
  late String title;
  late String overview;
  late String posterPath;
  late double voteAverage;

  // Interaction flags
  late bool isLiked;
  late bool isWatchLater;
  String? userNote;

  late DateTime timestamp;
}
