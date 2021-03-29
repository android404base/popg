import 'package:equatable/equatable.dart';

import '../../domain/entities/game.dart';

abstract class ListGamesEvent extends Equatable {
  const ListGamesEvent();

  @override
  List<Object> get props => [];
}

class ListGamesLoaded extends ListGamesEvent {}

class ListGamesRefreshed extends ListGamesEvent {
  final List<Game> fetchedGames;
  final int offset;

  const ListGamesRefreshed({
    required this.fetchedGames,
    required this.offset,
  });

  @override
  List<Object> get props => [fetchedGames, offset];

  @override
  String toString() =>
      ('ListGamesRefreshed {fetchedGames : $fetchedGames, offset : $offset}');
}
