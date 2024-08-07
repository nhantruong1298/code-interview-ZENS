import 'package:jokes_app/domain/entities/joke.dart';

abstract class JokeRepository {
  Future<Joke> getJokes();

  Future<void> saveShowedJoke(int id);

  Future<List<String>> loadShowedJokesIds();
}
