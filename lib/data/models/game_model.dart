import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class GameModel extends Equatable {
  @primaryKey
  final String checksum;
  final String name;
  final String summary;
  final String storyline;
  final String url;
  final String coverReferenceId;

  final double rating;

  GameModel({
    @required this.checksum,
    @required this.name,
    @required this.summary,
    @required this.storyline,
    @required this.url,
    @required this.coverReferenceId,
    @required this.rating,
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
      'GameModel {checksum : $checksum, name : $name, summary : $summary, '
      'storyline : $storyline, url : $url, coverReferenceId : $coverReferenceId, rating : $rating}';

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        checksum: json['checksum'],
        name: json['name'],
        summary: json['summary'],
        storyline: json['storyline'],
        url: json['url'],
        coverReferenceId: json['coverReferenceId'],
        rating: (json['rating'] as num).toDouble(),
      );
}
