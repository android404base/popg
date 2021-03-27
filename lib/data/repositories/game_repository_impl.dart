import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/game.dart';
import '../../domain/repositories/game_repository.dart';
import '../sources/sources.dart';
import '../../core/network/network_info.dart';
import '../../core/errors/exception.dart';

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
  Future<Either<Failure, List<Game>>> getAllGames() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteGames = await remoteDataSource.getAllGames();
        remoteGames.forEach((game) {
          localDataSource.saveGames(game);
        });
        return Right(
            remoteGames.map((model) => Game.fromModel(model)).toList());
      } on ServerException {
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
