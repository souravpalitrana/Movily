import 'package:movily_app/domain/entities/movie.dart';

abstract class GetMoviesByGenreUseCase {
  Future<List<Movie>> execute(String name);
}
