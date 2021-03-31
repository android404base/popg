import 'package:equatable/equatable.dart';

import '../../data/models/game_model.dart';

/// [Game] class is plain dart class which we will use in Flutter part.
///
class Game extends Equatable {
  final int id;

  final String name;
  final String summary;
  final String storyline;
  final String url;
  final String coverReferenceId;

  final double rating;

  Game({
    required this.id,
    required this.name,
    required this.summary,
    required this.storyline,
    required this.url,
    required this.coverReferenceId,
    required this.rating,
  });

  @override
  List<Object> get props => [
        id,
        name,
        summary,
        storyline,
        url,
        coverReferenceId,
        rating,
      ];

  @override
  String toString() => 'Game {id : $id, name : $name, summary : $summary, '
      'storyline : $storyline, url : $url, coverReferenceId : $coverReferenceId, rating : $rating}';

  GameModel toModel() => GameModel(
        id: id,
        name: name,
        summary: summary,
        storyline: storyline,
        url: url,
        coverReferenceId: coverReferenceId,
        rating: rating,
      );

  static Game fromModel(GameModel model) => Game(
        id: model.id,
        name: model.name,
        summary: model.summary,
        storyline: model.storyline,
        url: model.url,
        coverReferenceId: model.coverReferenceId,
        rating: model.rating,
      );
}
