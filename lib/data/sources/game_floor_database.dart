import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'game_local_data_source.dart';
import '../models/game_model.dart';

part 'game_floor_database.g.dart';

@Database(version: 1, entities: [GameModel])
abstract class AppDatabase extends FloorDatabase {
  GameModelDao get gameModelDao;
}
