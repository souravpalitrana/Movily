import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movily_app/domain/entities/movie.dart';
import 'package:movily_app/presentation/features/home/widgets/movie_grid_item.dart';

class MovieList extends ConsumerWidget {
  const MovieList({required this.movieList, super.key});

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final Movie movie in movieList)
          MovieGridItem(
            movie: movie,
          )
      ],
    );
  }
}
