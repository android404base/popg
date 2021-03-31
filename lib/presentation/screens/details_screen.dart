import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popg/presentation/widgets/custom_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/list_games/list_games.dart';
import '../../domain/entities/game.dart';
import '../../core/constants.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details-screen';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    return BlocBuilder<ListGamesBloc, ListGamesState>(
        builder: (context, state) {
      final game = (state as ListGamesLoadSuccess)
          .games
          .firstWhere((game) => game.id == id,
              orElse: () => Game(
                    id: 0,
                    name: '',
                    summary: '',
                    storyline: '',
                    url: '',
                    coverReferenceId: '',
                    rating: 0,
                  ));
      return Scaffold(
        appBar: AppBar(
          title: Text('PopG Details'),
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        child: Image.network(
                          httpsAdd + game.coverReferenceId,
                          headers: {
                            clientIdKey: clientIdValue,
                            authKey: authValue,
                          },
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 30.0, top: 30.0, bottom: 30.0),
                              child: const Placeholder(
                                color: Colors.grey,
                                fallbackHeight: 120,
                              ),
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 8),
                              child: Text('${game.name}'),
                            ),
                            CustomRatingBar(rating: game.rating),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Colors.black,
//                      color: Color.fromRGBO(58, 66, 86, 1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Summary',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text('${game.summary}'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Colors.black,
//                      color: Color.fromRGBO(58, 66, 86, 1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Storyline',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text('${game.storyline}'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    minWidth: double.infinity,
//                    color: Colors.black,
                    color: Color.fromRGBO(58, 66, 86, 1.0),
                    elevation: 5,
                    onPressed: () {
                      _launchURL(game.url);
                    },
                    child: Text(
                      'Find out more about the game',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

void _launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
