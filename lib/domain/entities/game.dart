import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/game_model.dart';

class Game extends Equatable {
  final String checksum;
  final String name;
  final String summary;
  final String storyline;
  final String url;
  final String coverReferenceId;

  final double rating;

  Game({
    required this.checksum,
    required this.name,
    required this.summary,
    required this.storyline,
    required this.url,
    required this.coverReferenceId,
    required this.rating,
  });

  @override
  List<Object> get props => [
        checksum,
        name,
        summary,
        storyline,
        url,
        coverReferenceId,
        rating,
      ];

  @override
  String toString() =>
      'Game {checksum : $checksum, name : $name, summary : $summary, '
      'storyline : $storyline, url : $url, coverReferenceId : $coverReferenceId, rating : $rating}';

  GameModel toModel() => GameModel(
        checksum: checksum,
        name: name,
        summary: summary,
        storyline: storyline,
        url: url,
        coverReferenceId: coverReferenceId,
        rating: rating,
      );

  static Game fromModel(GameModel model) => Game(
        checksum: model.checksum,
        name: model.name,
        summary: model.summary,
        storyline: model.storyline,
        url: model.url,
        coverReferenceId: model.coverReferenceId,
        rating: model.rating,
      );
}
