import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movily_app/data/repository/movie_repository_provider.dart';
import 'package:movily_app/domain/usecase/impl/get_movies_by_genre_usecase_impl.dart';

final getMoviesByGenreUseCaseProvider = Provider((ref) {
  return GetMoviesByGenreUseCaseImpl(
      movieRepository: ref.read(movieRepositoryProviders));
});
