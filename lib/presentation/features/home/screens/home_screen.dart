import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movily_app/presentation/base/app_constants.dart';
import 'package:movily_app/presentation/features/home/widgets/movie_genres_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final bool _isGenreLoading = false;
  final bool _isMovieLoading = false;
  final TextEditingController _searchControler = TextEditingController();

  void loadData() async {}

  @override
  Widget build(BuildContext context) {
    /*return return Scaffold(
      appBar: AppBar(
        title: const Text('flutterassets.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // Add padding around the search bar
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          // Use a Material design search bar
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              // Add a clear button to the search bar
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => _searchController.clear(),
              ),
              // Add a search icon or button to the search bar
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Perform the search here
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      ),
    );*/

    Widget content = const Center(
      child: Text(
        'Welcome to Movily App',
      ),
    );
    if (_isGenreLoading) {
      content = _getGenreLoadingWidget();
    } else {
      content = Padding(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Container(
              height: 44,
              child: const MovieGeneresList(
                genres: [
                  "Action",
                  "Adventure",
                  "Animation",
                  "Comedy",
                  "Crime",
                  "Documentary",
                  "Drama"
                ],
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
                      // Perform the search here
                      print(_searchControler.text);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
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

  Widget _getGenreLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
/*
Expanded(
              child: MovieGeneresList(
                genres: [
                  "Action",
                  "Adventure",
                  "Animation",
                  "Comedy",
                  "Crime",
                  "Documentary",
                  "Drama"
                ],
              ),
            ),
            */
