import 'package:cinemapedia_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia_app/infrastructure/repositories/movie_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// ! REPOSITORIO INMUTABLE
final movieRepositoryProvider = Provider((ref){
  return MovieRepositoryImpl(MovieDBDataSource());
});