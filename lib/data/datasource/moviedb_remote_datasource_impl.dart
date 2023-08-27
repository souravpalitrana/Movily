import 'package:movily_app/domain/datasource/remote_datasource.dart';
import 'package:movily_app/domain/entities/genre.dart';
import 'package:movily_app/domain/entities/movie.dart';

class MovieDbRemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<List<Genre>> getGenre() async {
    return [
      Genre(id: 1, name: "Action"),
      Genre(id: 1, name: "Adventure"),
      Genre(id: 1, name: "Animation"),
      Genre(id: 1, name: "Comedy"),
      Genre(id: 1, name: "Crime"),
      Genre(id: 1, name: "Documentary"),
      Genre(id: 1, name: "Drama"),
    ];
  }

  @override
  Future<List<Movie>> getMoviesByGenre(String name) async {
    return [
      Movie(
          title: "Avenger",
          backdropPath:
              'http://image.tmdb.org/t/p/w185/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg',
          voteCount: 1,
          voteAverage: 5),
      Movie(
          title: "Avenger",
          backdropPath:
              'http://image.tmdb.org/t/p/w185/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg',
          voteCount: 1,
          voteAverage: 5),
      Movie(
          title: "Avenger",
          backdropPath:
              'http://image.tmdb.org/t/p/w185/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg',
          voteCount: 1,
          voteAverage: 5),
      Movie(
          title: "Avenger",
          backdropPath:
              'http://image.tmdb.org/t/p/w185/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg',
          voteCount: 1,
          voteAverage: 5),
      Movie(
          title: "Avenger",
          backdropPath:
              'http://image.tmdb.org/t/p/w185/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg',
          voteCount: 1,
          voteAverage: 5),
      Movie(
          title: "Avenger",
          backdropPath:
              'http://image.tmdb.org/t/p/w185/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg',
          voteCount: 1,
          voteAverage: 5),
      Movie(
          title: "Avenger",
          backdropPath:
              'http://image.tmdb.org/t/p/w185/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg',
          voteCount: 1,
          voteAverage: 5),
      Movie(
          title: "Avenger",
          backdropPath:
              'http://image.tmdb.org/t/p/w185/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg',
          voteCount: 1,
          voteAverage: 5),
      Movie(
          title: "Avenger",
          backdropPath:
              'http://image.tmdb.org/t/p/w185/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg',
          voteCount: 1,
          voteAverage: 5),
      Movie(
          title: "Avenger",
          backdropPath:
              'http://image.tmdb.org/t/p/w185/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg',
          voteCount: 1,
          voteAverage: 5),
    ];
  }
}
