// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../../domain/repositories/game_repository.dart';
import '../../domain/entities/game.dart';
import '../../core/errors/failures.dart';
import '../../core/constants.dart';
import 'list_games.dart';

class ListGamesBloc extends Bloc<ListGamesEvent, ListGamesState> {
  final GameRepository gameRepository;

  ListGamesBloc({required this.gameRepository})
      : super(ListGamesLoadInProgress());

  @override
  Stream<ListGamesState> mapEventToState(ListGamesEvent event) async* {
    if (event is ListGamesLoaded) {
      yield* _mapListGamesLoadedToState(event);
    } else if (event is ListGamesRefreshed) {
      yield* _mapListGamesRefreshedToState(event);
    }
  }

  Stream<ListGamesState> _mapListGamesLoadedToState(
      ListGamesLoaded event) async* {
    final Either<Failure, List<Game>> failureOrGames =
        await gameRepository.getAllGames(0);
    yield failureOrGames.fold(
      (failure) => ListGamesLoadFailure(message: _mapFailureToMessage(failure)),
      (games) => ListGamesLoadSuccess(games),
    );
  }

  Stream<ListGamesState> _mapListGamesRefreshedToState(
      ListGamesRefreshed event) async* {
    final Either<Failure, List<Game>> failureOrNewGames =
        await gameRepository.getAllGames(event.offset);
    yield failureOrNewGames.fold(
      (failure) => ListGamesLoadFailure(message: _mapFailureToMessage(failure)),
      (newGames) => ListGamesLoadSuccess(event.fetchedGames..addAll(newGames)),
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
