import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movily_app/presentation/base/app_constants.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final bool _isLoading = false;

  void loadData() async {}

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text(
        'Welcome to Movily App',
      ),
    );
    if (_isLoading) {
      content = _getLoadingWidget();
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
