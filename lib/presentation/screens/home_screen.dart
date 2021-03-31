import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/list_games/list_games.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  late ListGamesBloc _gamesBloc;
  int offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _gamesBloc = context.read<ListGamesBloc>();
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ListGamesBloc, ListGamesState>(
        builder: (context, state) {
      if (state is ListGamesLoadInitial) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ListGamesLoadSuccess) {
        offset = state.games.length;
        print(offset);
        return ListView.builder(
          itemCount:
              state.hasReachedMax ? state.games.length : state.games.length + 1,
          controller: _scrollController,
          itemBuilder: (context, index) {
            return index >= state.games.length
                ? BottomCircular()
                : ListItem(
                    id: state.games[index].id,
                    coverRef: state.games[index].coverReferenceId,
                    name: state.games[index].name,
                    rating: state.games[index].rating,
                  );
          },
        );
      }
      if (state is ListGamesLoadFailure) {
        return Center(child: Text(state.message));
      } else {
        return Center(child: Text('Unexpected Error!'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopG'),
        elevation: 0.2,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      body: _buildBody(context),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _gamesBloc.add(ListGamesLoaded(offset: offset, limit: 10));
    }
  }
}
