import 'package:get_it/get_it.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';

import 'bloc/list_games/list_games.dart';
import 'domain/repositories/game_repository.dart';
import 'data/repositories/game_repository_impl.dart';
import 'data/sources/sources.dart';
import 'data/sources/local/game_floor_database.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => ListGamesBloc(
      gameRepository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<GameRepository>(
    () => GameRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<GameRemoteDataSource>(
    () => GameRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  final database =
      await $FloorAppDatabase.databaseBuilder('game_database.db').build();

  sl.registerLazySingleton<GameModelDao>(
    () => database.gameModelDao,
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl()),
  );

  // Other Libraries
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
