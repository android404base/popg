import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class GameModel extends Equatable {
  @primaryKey
  final int id;

  final String name;
  final String summary;
  final String storyline;
  final String url;
  final String coverReferenceId;

  final double rating;

  GameModel({
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
  String toString() => 'GameModel {id : $id, name : $name, summary : $summary, '
      'storyline : $storyline, url : $url, coverReferenceId : $coverReferenceId, rating : $rating}';

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        id: (json['id'] as num).toInt(),
        name: json['name'],
        summary: json['summary'],
        storyline: json['storyline'],
        url: json['url'],
        coverReferenceId: json['cover']['url'],
        rating: (json['rating'] as num).toDouble(),
      );
}
