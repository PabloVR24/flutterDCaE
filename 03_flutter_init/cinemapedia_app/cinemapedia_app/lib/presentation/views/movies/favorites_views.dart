import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:cinemapedia_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();
    if (favoriteMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline_sharp,
              size: 60,
              color: colors.primary,
            ),
            Text(
              'Esto esta muy vacio',
              style: TextStyle(fontSize: 30, color: colors.primary),
            ),
             const Text(
              '¿Porque no vamos a explorar peliculas?',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20,),
            FilledButton.icon(onPressed: (){context.go('/home/0');}, icon: const Icon(Icons.movie), label: const Text('Inicio'))
          ],
        ),
      );
    }

    return MovieMasonry(
      movies: favoriteMovies,
      loadNextPage: loadNextPage,
    );
  }
}