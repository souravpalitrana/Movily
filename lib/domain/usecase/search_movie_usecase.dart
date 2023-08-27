import 'package:movily_app/domain/entities/movie.dart';

abstract class SearchMovieUseCase {
  Future<List<Movie>> execute(String keyword);
}
