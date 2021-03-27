import '../models/game_model.dart';

abstract class GameRemoteDataSource {
  /// Calls the ​https://api-docs.igdb.com/#game
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<GameModel>> getAllGames();
}
