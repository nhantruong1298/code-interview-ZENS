import 'package:jokes_app/data/source/data_mapper/joke_data_mapper.dart';
import 'package:jokes_app/data/source/network/api.dart';
import 'package:jokes_app/domain/entities/joke.dart';
import 'package:jokes_app/domain/repository/joke_repository.dart';

class JokeRepositoryImpl implements JokeRepository {
  final Api _api;
  final JokeDataMapper _dataMapper;

  JokeRepositoryImpl(
    this._api,
    this._dataMapper,
  );

  @override
  Future<Joke> getJokes() async {
    final response = await _api.getJoke();
    return _dataMapper.mapJokeModel(response);
  }
  
  @override
  Future<List<String>> loadShowedJokesIds() {
    return _api.loadShowedJokesIds();
  }
  
  @override
  Future<void> saveShowedJoke(int id) {
    return _api.saveShowedJoke(id);
  }
}
