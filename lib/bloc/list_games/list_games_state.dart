import 'package:equatable/equatable.dart';

import '../../domain/entities/game.dart';

abstract class ListGamesState extends Equatable {
  const ListGamesState();

  @override
  List<Object> get props => [];
}

class ListGamesLoadInitial extends ListGamesState {}

class ListGamesLoadSuccess extends ListGamesState {
  final List<Game> games;
  final bool hasReachedMax;

  const ListGamesLoadSuccess({
    required this.games,
    required this.hasReachedMax,
  });

  ListGamesLoadSuccess copyWith(
    List<Game> games,
    bool hasReachedMax,
  ) {
    return ListGamesLoadSuccess(
      games: games,
      hasReachedMax: hasReachedMax,
    );
  }

  @override
  List<Object> get props => [
        games,
        hasReachedMax,
      ];

  @override
  String toString() =>
      'ListGamesLoadSuccess : {member : $games, hasReachedMax : $hasReachedMax}';
}

class ListGamesLoadFailure extends ListGamesState {
  final String message;

  const ListGamesLoadFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'ListGamesLoadFailure : {message : $message}';
}
