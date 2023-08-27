import 'package:movily_app/domain/entities/movie.dart';

abstract class CacheDataSource {
  Future<List<Movie>> searchMovie(String keyword);
  Future<void> addMovies(List<Movie> movies);
}
