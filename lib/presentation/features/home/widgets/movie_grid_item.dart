import 'package:flutter/material.dart';
import 'package:movily_app/domain/entities/movie.dart';

class MovieGridItem extends StatelessWidget {
  const MovieGridItem({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            Colors.blue.withOpacity(0.55),
            Colors.blue.withOpacity(0.9),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          movie.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
