import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../../core/errors/failures.dart';

abstract class GameRepository {
  Future<Either<Failure, List<Game>>> getAllGames();
}