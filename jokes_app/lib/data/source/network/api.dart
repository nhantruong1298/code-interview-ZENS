import 'dart:convert';

import 'package:jokes_app/data/models/joke_model.dart';
import 'package:http/http.dart' as http;
import 'package:jokes_app/data/source/data_storage/data_storage.dart';

abstract class Api {
  factory Api.create(DataStorage dataStorage) {
    return _ApiImpl(
      dataStorage: dataStorage,
    );
  }
  Future<JokeModel> getJoke();

  Future<void> saveShowedJoke(int id);

  Future<List<String>> loadShowedJokesIds();
}

mixin _ApiKeys {
  final showedJokes = 'showedJokes';
}

class _ApiImpl with _ApiKeys implements Api {
  final DataStorage dataStorage;

  _ApiImpl({required this.dataStorage});

  @override
  Future<JokeModel> getJoke() async {
    final response =
        await http.get(Uri.parse('https://v2.jokeapi.dev/joke/Any'));

    if (response.statusCode == 200) {
      return JokeModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load joke');
    }
  }

  @override
  Future<void> saveShowedJoke(int id) async {
    final ids = await dataStorage.getStringList(showedJokes);

    ids.add(id.toString());

    await dataStorage.setStringList(showedJokes, ids);
  }

  @override
  Future<List<String>> loadShowedJokesIds() {
    return dataStorage.getStringList(showedJokes);
  }
}
