import 'package:movily_app/domain/entities/genre.dart';
import 'package:movily_app/domain/entities/movie.dart';

abstract class RemoteDataSource {
  Future<List<Genre>> getGenre();
  Future<List<Movie>> getMoviesByGenre(String name);
}
