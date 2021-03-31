// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../entities/game.dart';
import '../../core/errors/failures.dart';

/// [GameRepository] class is an abstract layer between
/// data layer and domain layer.
///
abstract class GameRepository {
  Future<Either<Failure, List<Game>>> getAllGames(int offset, int limit);
}
