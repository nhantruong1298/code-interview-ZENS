
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

import 'package:jokes_app/data/models/joke_model.dart';
import 'package:jokes_app/data/source/data_mapper/joke_data_mapper.dart';

void main() {
  group('DataMapper', () {
    late JokeDataMapper jokeDataMapper;

    setUpAll(() {
      jokeDataMapper = JokeDataMapper();
    });

    test('Map joke data to joke object', () {
      final jokeModel = JokeModel(
        id: 1,
        setup: 'What do you call a bear with no teeth?',
        delivery: 'A gummy bear.',
      );

      final joke = jokeDataMapper.mapJokeModel(jokeModel);

      expect(jokeModel.id, joke.id);
      expect(jokeModel.setup, joke.setup);
      expect(jokeModel.delivery, joke.delivery);
    });
  });
}
