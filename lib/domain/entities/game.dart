import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final String checksum;
  final String name;
  final String summary;
  final String storyline;
  final String url;
  final String coverReferenceId;

  final double rating;

  Game({
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
}
