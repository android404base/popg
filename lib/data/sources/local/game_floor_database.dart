import 'dart:async';

import 'package:floor/floor.dart';
import 'package:popg/core/errors/exception.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'game_local_data_source.dart';
import '../../models/game_model.dart';
import '../../../core/errors/exception.dart';

part 'game_floor_database.g.dart';

@Database(version: 1, entities: [GameModel])
abstract class AppDatabase extends FloorDatabase {
  GameModelDao get gameModelDao;
}
