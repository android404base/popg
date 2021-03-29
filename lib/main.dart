import 'dart:collection';
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:popg/data/models/game_model.dart';

void main() {
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
          child: Test(),
        ),
      ),
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

List<GameModel> gameList = [];
Future fetchName() async {
  Options baseOptions = Options(
    headers: {
      'Client-ID': 'ikefu3gjaojsnnt21ik7orxyofnztq',
      'Authorization': 'Bearer db5jrhvb88qx4pu14rhhun808agffp',
    },
  );
  Dio client = Dio();
  final response = await client.post(
    'https://api.igdb.com/v4/games',
    options: baseOptions,
    data: 'fields name,summary,storyline,url,cover.url,rating; '
        'where name != null & summary != null & storyline != null & '
        'url != null & cover.url != null & rating != null; '
        'limit 1; '
        'offset 25;',
  );
  print(response.statusCode);
  print(response);
  print(response.data[0]['cover']['url']);
  var jsonList = response.data as List;
  List<GameModel> gameList = [];

  jsonList.forEach((element) {
    gameList.add(GameModel.fromJson(element));
  });
  print(gameList[0].name);
  return response;
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: fetchName(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading....');
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return Text('Result: ${gameList.length}');
          }
        },
      ),
    );
  }
}

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
