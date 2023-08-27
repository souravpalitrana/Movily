import 'package:movily_app/domain/entities/movie.dart';
import 'package:movily_app/domain/repository/movie_repository.dart';
import 'package:movily_app/domain/usecase/search_movie_usecase.dart';

class SearchMoviesUseCaseImpl extends SearchMovieUseCase {
  SearchMoviesUseCaseImpl({required this.movieRepository});

  final MovieRepository movieRepository;

  @override
  Future<List<Movie>> execute(String keyword) {
    return movieRepository.searchMovie(keyword);
  }
}
