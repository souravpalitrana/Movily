import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movily_app/data/datasource/cache_datasource_provider.dart';
import 'package:movily_app/data/datasource/remote_datasource_provider.dart';
import 'package:movily_app/data/repository/movie_repository_impl.dart';

final movieRepositoryProviders = Provider((ref) {
  return MovieRepositoryImpl(
      cacheDataSource: ref.watch(cacheDataSourceProvider),
      remoteDataSource: ref.read(remoteDataSourceProvider));
});
