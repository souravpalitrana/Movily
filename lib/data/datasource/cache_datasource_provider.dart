import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movily_app/data/datasource/simple_inmemory_cache_datasource_impl.dart';

final cacheDataSourceProvider = Provider((ref) {
  return SimpleInMemoryCacheDataSourceImpl();
});
