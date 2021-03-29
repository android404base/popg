import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popg/bloc/list_games/list_games.dart';

import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Test2(),
        ),
      ),
    );
  }
}

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}

BlocProvider<ListGamesBloc> _buildBody(BuildContext context) {
  return BlocProvider(
    create: (_) => di.sl<ListGamesBloc>()..add(ListGamesLoaded()),
    child: Center(
      child: BlocBuilder<ListGamesBloc, ListGamesState>(
        builder: (context, state) {
          if (state is ListGamesLoadInProgress) {
            return CircularProgressIndicator();
          } else if (state is ListGamesLoadSuccess) {
            print(state.games);
            return Container(
              color: Colors.green,
            );
          } else {
            return Text('ERROR');
          }
        },
      ),
    ),
  );
}
