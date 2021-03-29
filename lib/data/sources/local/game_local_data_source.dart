import 'package:floor/floor.dart';

import '../../models/game_model.dart';

@dao
abstract class GameModelDao {
  /// Gets the cached [GameModel] list which was retrieved the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  @Query('SELECT * FROM GameModel')
  Future<List<GameModel>> getLastAllGames();

  /// Stores [GameModel] into device with floor.
  ///
  /// Throws [CacheException] if something goes wrong.
  @insert
  Future<void> saveGame(GameModel game);
}
