import 'package:cinemapedia_app/infrastructure/datasources/actors_moviedb_datasource.dart';
import 'package:cinemapedia_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// ! REPOSITORIO INMUTABLE
final actorsRepositoryProvider = Provider((ref){
  return ActorRepositoryImpl(ActorMovieDVDataSource());
});