import 'package:movily_app/domain/entities/genre.dart';
import 'package:movily_app/domain/repository/movie_repository.dart';
import 'package:movily_app/domain/usecase/get_genre_usecase.dart';

class GetGenreUseCaseImpl extends GetGenreUseCase {
  GetGenreUseCaseImpl({required this.movieRepository});

  final MovieRepository movieRepository;

  @override
  Future<List<Genre>?> execute() {
    return movieRepository.getGenre();
  }
}
