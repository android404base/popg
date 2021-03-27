import '../models/game_model.dart';

abstract class GameLocalDataSource {
  /// Gets the cached [GameModel] list which was retrieved the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<GameModel> getAllGames();

  /// Stores [GameModel] list into device with floor.
  ///
  /// Throws [CacheException] if something goes wrong.
  Future<void> saveGames(List<GameModel> games);
}
