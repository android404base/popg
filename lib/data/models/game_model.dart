import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

@HiveType()
class GameModel extends Equatable {
  @HiveField(0)
  final String checksum;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String summary;
  @HiveField(3)
  final String storyline;
  @HiveField(4)
  final String url;
  @HiveField(5)
  final String coverReferenceId;

  @HiveField(6)
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

  Map<String, dynamic> toJson() => {
        'checksum': checksum,
        'name': name,
        'summary': summary,
        'storyline': storyline,
        'url': url,
        'coverReferenceId': coverReferenceId,
        'rating': rating,
      };
}
