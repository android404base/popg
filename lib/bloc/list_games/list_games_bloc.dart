// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/repositories/game_repository.dart';
import '../../domain/entities/game.dart';
import '../../core/errors/failures.dart';
import '../../core/constants.dart';
import 'list_games.dart';

class ListGamesBloc extends Bloc<ListGamesEvent, ListGamesState> {
  final GameRepository gameRepository;

  ListGamesBloc({required this.gameRepository}) : super(ListGamesLoadInitial());

  @override
  Stream<ListGamesState> mapEventToState(ListGamesEvent event) async* {
    final currentState = state;
    if (event is ListGamesLoaded) {
      if (currentState is ListGamesLoadInitial) {
        yield* _mapListGamesLoadedToState(event);
      }
      if (currentState is ListGamesLoadSuccess) {
        yield* _mapListGamesRefreshedToState(event, currentState);
      }
    }
  }

  Stream<ListGamesState> _mapListGamesLoadedToState(
      ListGamesLoaded event) async* {
    final Either<Failure, List<Game>> failureOrGames =
        await gameRepository.getAllGames(event.offset, event.limit);
    yield failureOrGames.fold(
      (failure) => ListGamesLoadFailure(message: _mapFailureToMessage(failure)),
      (games) => ListGamesLoadSuccess(games: games, hasReachedMax: false),
    );
  }

  Stream<ListGamesState> _mapListGamesRefreshedToState(
      ListGamesLoaded event, ListGamesLoadSuccess currentState) async* {
    final Either<Failure, List<Game>> failureOrNewGames =
        await gameRepository.getAllGames(event.offset, event.limit);
    yield failureOrNewGames.fold(
      (failure) => ListGamesLoadFailure(message: _mapFailureToMessage(failure)),
      (newGames) => currentState.copyWith(
          List.of(currentState.games)..addAll(newGames), false),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
