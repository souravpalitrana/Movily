class Movie {
  const Movie({
    required this.title,
    required this.backdropPath,
    required this.voteCount,
    required this.voteAverage,
  });

  final String title;
  final String backdropPath;
  final int voteCount;
  final int voteAverage;
}
