import 'package:equatable/equatable.dart';

abstract class ListGamesEvent extends Equatable {
  const ListGamesEvent();

  @override
  List<Object> get props => [];
}

class ListGamesLoaded extends ListGamesEvent {
  final int offset;
  final int limit;

  const ListGamesLoaded({
    required this.offset,
    required this.limit,
  });

  @override
  List<Object> get props => [
        offset,
        limit,
      ];

  @override
  String toString() => ('ListGamesLoaded { offset : $offset, limit : $limit}');
}
