import 'package:dartz/dartz.dart';

import '../entities/game.dart';
import '../../core/errors/failures.dart';

abstract class GameRepository {
  Future<Either<Failure, List<Game>>> getAllGames(int offset);
}
