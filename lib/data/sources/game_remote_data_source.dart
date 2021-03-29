// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';

import '../models/game_model.dart';
import '../../core/errors/exception.dart';
import '../../core/constants.dart' as constants;

abstract class GameRemoteDataSource {
  /// Calls the ​https://api-docs.igdb.com/#game
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<GameModel>> getAllGames(int offset);
}

class GameRemoteDataSourceImpl implements GameRemoteDataSource {
  final Dio client;

  GameRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<GameModel>> getAllGames(int offset) async {
    final _baseOptions = Options(
      headers: {
        constants.clientIdKey: constants.clientIdValue,
        constants.authKey: constants.authValue,
      },
    );

    final response = await client.post(
      constants.httpsAdd + constants.baseUrl,
      options: _baseOptions,
      data: constants.requestBody + 'offset $offset;',
    );

    var jsonList = response.data as List;
    List<GameModel> gameList = [];

    jsonList.forEach((element) {
      gameList.add(GameModel.fromJson(element));
    });

    if (response.statusCode == 200 && gameList.isNotEmpty) {
      return gameList;
    } else {
      throw ServerException();
    }
  }
}
