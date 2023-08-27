import 'package:movily_app/domain/entities/genre.dart';

abstract class GetGenreUseCase {
  Future<List<Genre>?> execute();
}
