import 'package:movily_app/domain/entities/genre.dart';
import 'package:movily_app/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Genre>> getGenre();
  Future<List<Movie>> searchMovie(String keyword);
  Future<List<Movie>> getMoviesByGenre(String name);
}
