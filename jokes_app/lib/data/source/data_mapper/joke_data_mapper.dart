import 'package:jokes_app/data/models/joke_model.dart';
import 'package:jokes_app/domain/entities/joke.dart';

class JokeDataMapper {
  Joke mapJokeModel(JokeModel model) {
    return Joke(
      id: model.id,
      setup: model.setup,
      delivery: model.delivery,
    );
  }
}
