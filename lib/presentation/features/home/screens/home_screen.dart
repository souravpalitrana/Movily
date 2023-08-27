import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movily_app/domain/entities/genre.dart';
import 'package:movily_app/domain/entities/movie.dart';
import 'package:movily_app/domain/usecase/provider/get_genre_usecase_provider.dart';
import 'package:movily_app/domain/usecase/provider/get_movies_by_genre_usecase_provider.dart';
import 'package:movily_app/domain/usecase/provider/search_movie_usecase_provider.dart';
import 'package:movily_app/presentation/base/app_constants.dart';
import 'package:movily_app/presentation/features/home/widgets/movie_genres_list.dart';
import 'package:movily_app/presentation/features/home/widgets/movie_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _isGenreLoading = true;
  bool _isMovieLoading = false;
  late List<Genre> _allGenre;
  final List<Movie> _filteredMovies = [];
  final TextEditingController _searchControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadGenre();
  }

  void _loadGenre() async {
    setState(() {
      _isGenreLoading = true;
    });
    final getGenreUsecase = ref.read(getGenreUseCaseProvider);
    final genres = await getGenreUsecase.execute();
    if (genres == null || genres.isEmpty) {
      _showMessage("Could not show data right Now");
    } else {
      setState(() {
        _isGenreLoading = false;
        _isMovieLoading = true;
        _allGenre = genres;
      });
      _loadMoviesByGenre(_allGenre[0]);
    }
  }

  void _loadMoviesByGenre(Genre genre) async {
    setState(() {
      _isGenreLoading = false;
      _isMovieLoading = true;
    });
    final getMoviesByGenreUseCase = ref.read(getMoviesByGenreUseCaseProvider);
    final movies = await getMoviesByGenreUseCase.execute(genre.name);
    if (movies.isNotEmpty) {
      _filteredMovies.clear();
      final modified = movies.map((movie) {
        movie.title = "${genre.name}\n${movie.title}";
        return movie;
      }).toList();
      setState(() {
        _filteredMovies.addAll(modified);
        _isMovieLoading = false;
      });
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  void _onSelectGenre(Genre genre) {
    _loadMoviesByGenre(genre);
  }

  void _searchMovie(String keyword) async {
    final searchMovieUseCase = ref.read(searchMovieUseCaseProvider);
    setState(() {
      _isMovieLoading = true;
    });
    final searchedMovies = await searchMovieUseCase.execute(keyword);
    if (searchedMovies.isEmpty) {
      _showMessage("No result found");
    } else {
      setState(() {
        _filteredMovies.clear();
        final modified = searchedMovies.map((movie) {
          movie.title = "Cached Data\n${movie.title}";
          return movie;
        }).toList();
        setState(() {
          _filteredMovies.addAll(modified);
          _isMovieLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text(
        'Welcome to Movily App',
      ),
    );
    if (_isGenreLoading) {
      content = _getLoadingWidget();
    } else {
      content = Padding(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Container(
              height: 44,
              child: MovieGeneresList(
                genres: _allGenre,
                onSelectedGenre: _onSelectGenre,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _searchControler,
                decoration: InputDecoration(
                  hintText: 'Search your movie...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _searchControler.clear(),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      if (_searchControler.text.trim().isEmpty) {
                        _showMessage("Please insert a valid keyword");
                      } else {
                        _searchMovie(_searchControler.text.trim());
                      }
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _isMovieLoading
                ? _getLoadingWidget()
                : Expanded(
                    child: MovieList(
                    movieList: _filteredMovies,
                  )),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          kAppName,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: content,
    );
  }

  Widget _getLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
