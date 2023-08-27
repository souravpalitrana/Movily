import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movily_app/data/repository/movie_repository_provider.dart';
import 'package:movily_app/domain/usecase/impl/search_movies_usecase_impl.dart';

final searchMovieUseCaseProvider = Provider((ref) {
  return SearchMoviesUseCaseImpl(
      movieRepository: ref.read(movieRepositoryProviders));
});
