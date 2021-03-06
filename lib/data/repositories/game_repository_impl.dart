// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/game.dart';
import '../../domain/repositories/game_repository.dart';
import '../sources/sources.dart';
import '../../core/network/network_info.dart';
import '../../core/errors/exception.dart';

/// Gets fresh data from the API when there is an Internet connection
/// and to get the cached data when the user is offline
///
/// Returns [ServerFailure] and [CacheFailure] when an error occurred.

class GameRepositoryImpl implements GameRepository {
  final GameRemoteDataSource remoteDataSource;
  final GameModelDao localDataSource;
  final NetworkInfo networkInfo;

  GameRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Game>>> getAllGames(int offset, int limit) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteGames = await remoteDataSource.getAllGames(offset, limit);

        remoteGames.forEach((game) async {
          localDataSource.saveGame(game);
        });

        return Right(
            remoteGames.map((model) => Game.fromModel(model)).toList());
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localGames = await localDataSource.getLastAllGames();
        return Right(localGames.map((model) => Game.fromModel(model)).toList());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
