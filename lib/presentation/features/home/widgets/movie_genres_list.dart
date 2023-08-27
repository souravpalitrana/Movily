import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movily_app/domain/entities/genre.dart';

class MovieGeneresList extends ConsumerStatefulWidget {
  const MovieGeneresList(
      {required this.genres, required this.onSelectedGenre, super.key});

  final void Function(Genre) onSelectedGenre;
  final List<Genre> genres;

  @override
  ConsumerState<MovieGeneresList> createState() => _MovieGeneresListState();
}

class _MovieGeneresListState extends ConsumerState<MovieGeneresList> {
  final Color _selectedColor = const Color.fromARGB(255, 222, 116, 11);
  var _selectedIdx = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.genres.length,
      itemBuilder: (ctx, index) => Container(
        padding: const EdgeInsets.only(left: 16, right: 8),
        height: 44,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedIdx = index;
            });
            widget.onSelectedGenre(widget.genres[index]);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            backgroundColor: index == _selectedIdx
                ? _selectedColor
                : const Color.fromARGB(255, 202, 221, 227),
          ),
          child: Text(
            widget.genres[index].name,
            style: TextStyle(
              color: _selectedIdx == index ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
