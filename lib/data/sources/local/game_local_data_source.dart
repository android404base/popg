import 'package:floor/floor.dart';

import '../../models/game_model.dart';

@dao
abstract class GameModelDao {
  /// Gets the cached [GameModel] list which was retrieved the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  @Query('SELECT * FROM GameModel')
  Future<List<GameModel>> getLastAllGames();

  /// Stores [GameModel] into device with floor.
  ///
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveGame(GameModel game);

  /// Finds the cached [GameModel] by id.
  ///
  @Query('SELECT * FROM GameModel WHERE id = :id')
  Future<GameModel?> findGameById(int id);
}
