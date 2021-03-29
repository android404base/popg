import 'package:equatable/equatable.dart';

import '../../domain/entities/game.dart';

abstract class ListGamesState extends Equatable {
  const ListGamesState();

  @override
  List<Object> get props => [];
}

class ListGamesLoadInProgress extends ListGamesState {}

class ListGamesLoadSuccess extends ListGamesState {
  final List<Game> games;

  const ListGamesLoadSuccess(this.games);

  @override
  List<Object> get props => [games];

  @override
  String toString() => 'ListGamesLoadSuccess : {member : $games}';
}

class ListGamesLoadFailure extends ListGamesState {
  final String message;

  const ListGamesLoadFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'ListGamesLoadFailure : {message : $message}';
}
