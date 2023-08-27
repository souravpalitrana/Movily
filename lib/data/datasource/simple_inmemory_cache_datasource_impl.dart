import 'package:movily_app/domain/datasource/cache_datasource.dart';
import 'package:movily_app/domain/entities/movie.dart';

class SimpleInMemoryCacheDataSourceImpl extends CacheDataSource {
  final List<Movie> _cachedMovies = [];

  @override
  Future<List<Movie>> searchMovie(String keyword) async {
    List<Movie> filteredMovies = [];
    _cachedMovies.map((movie) {
      movie.title = "Seached : ${movie.title}";
      /*if (movie.title.contains(keyword)) {
        filteredMovies.add(movie);
      }*/
      filteredMovies.add(movie);
    });
    return filteredMovies;
  }

  @override
  Future<void> addMovies(List<Movie> movies) async {
    _cachedMovies.clear();
    _cachedMovies.addAll(movies);
  }
}
