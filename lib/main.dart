import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popg/bloc/list_games/list_games.dart';
import 'package:popg/core/constants.dart';

import 'dependency_injection.dart' as di;
import 'presentation/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          di.sl<ListGamesBloc>()..add(ListGamesLoaded(offset: 0, limit: 10)),
      child: MaterialApp(
        title: 'PopG',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          DetailsScreen.routeName: (context) => DetailsScreen(),
        },
      ),
    );
  }
}
