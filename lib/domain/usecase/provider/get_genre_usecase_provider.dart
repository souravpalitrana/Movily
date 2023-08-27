import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movily_app/data/repository/movie_repository_provider.dart';
import 'package:movily_app/domain/usecase/impl/get_genre_usecase_impl.dart';

final getGenreUseCaseProvider = Provider((ref) {
  return GetGenreUseCaseImpl(
      movieRepository: ref.read(movieRepositoryProviders));
});
