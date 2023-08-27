import 'package:movily_app/domain/datasource/cache_datasource.dart';
import 'package:movily_app/domain/datasource/remote_datasource.dart';
import 'package:movily_app/domain/entities/genre.dart';
import 'package:movily_app/domain/entities/movie.dart';
import 'package:movily_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl(
      {required this.cacheDataSource, required this.remoteDataSource});

  final CacheDataSource cacheDataSource;
  final RemoteDataSource remoteDataSource;

  @override
  Future<List<Genre>> getGenre() async {
    return remoteDataSource.getGenre();
  }

  @override
  Future<List<Movie>> getMoviesByGenre(String name) async {
    List<Movie> movies = await remoteDataSource.getMoviesByGenre(name);
    cacheDataSource.addMovies(movies);
    return movies;
  }

  @override
  Future<List<Movie>> searchMovie(String keyword) async {
    return cacheDataSource.searchMovie(keyword);
  }
}
