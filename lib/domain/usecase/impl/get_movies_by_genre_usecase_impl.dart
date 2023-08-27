import 'package:movily_app/domain/entities/movie.dart';
import 'package:movily_app/domain/repository/movie_repository.dart';
import 'package:movily_app/domain/usecase/get_movies_by_genre_usecase.dart';

class GetMoviesByGenreUseCaseImpl extends GetMoviesByGenreUseCase {
  GetMoviesByGenreUseCaseImpl({required this.movieRepository});

  final MovieRepository movieRepository;

  @override
  Future<List<Movie>> execute(String name) {
    return movieRepository.getMoviesByGenre(name);
  }
}
