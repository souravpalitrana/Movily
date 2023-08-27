import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movily_app/data/datasource/moviedb_remote_datasource_impl.dart';

final remoteDataSourceProvider =
    Provider((ref) => MovieDbRemoteDataSourceImpl());
