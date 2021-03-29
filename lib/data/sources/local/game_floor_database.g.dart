// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_floor_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GameModelDao? _gameModelDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GameModel` (`checksum` TEXT NOT NULL, `name` TEXT NOT NULL, `summary` TEXT NOT NULL, `storyline` TEXT NOT NULL, `url` TEXT NOT NULL, `coverReferenceId` TEXT NOT NULL, `rating` REAL NOT NULL, PRIMARY KEY (`checksum`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  GameModelDao get gameModelDao {
    return _gameModelDaoInstance ??= _$GameModelDao(database, changeListener);
  }
}

class _$GameModelDao extends GameModelDao {
  _$GameModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _gameModelInsertionAdapter = InsertionAdapter(
            database,
            'GameModel',
            (GameModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'summary': item.summary,
                  'storyline': item.storyline,
                  'url': item.url,
                  'coverReferenceId': item.coverReferenceId,
                  'rating': item.rating
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GameModel> _gameModelInsertionAdapter;

  @override
  Future<List<GameModel>> getLastAllGames() async {
    final result = await _queryAdapter.queryList('SELECT * FROM GameModel',
        mapper: (Map<String, Object?> row) => GameModel(
            id: row['id'] as int,
            name: row['name'] as String,
            summary: row['summary'] as String,
            storyline: row['storyline'] as String,
            url: row['url'] as String,
            coverReferenceId: row['coverReferenceId'] as String,
            rating: row['rating'] as double));
    if (result.isNotEmpty) {
      return result;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveGame(GameModel game) async {
    await _gameModelInsertionAdapter.insert(game, OnConflictStrategy.abort);
  }
}
