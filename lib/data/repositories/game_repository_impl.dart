import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/game.dart';
import '../../domain/repositories/game_repository.dart';
import '../sources/sources.dart';
import '../../core/network/network_info.dart';

class GameRepositoryImpl implements GameRepository {
  final GameRemoteDataSource remoteDataSource;
  final GameLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GameRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Game>>> getAllGames() {
    // TODO: implement getAllGames
    throw UnimplementedError();
  }
}
