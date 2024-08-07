import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/domain/entities/joke.dart';
import 'package:jokes_app/domain/repository/joke_repository.dart';
import 'package:mocktail/mocktail.dart';

class JokeRepositoryMock extends Mock implements JokeRepository {}

void main() {
  test('jokes repository test', () async {
    final jokeRepository = JokeRepositoryMock();

    final mockJoke = Joke(
      id: 1,
      setup: 'What do you call a bear with no teeth?',
      delivery: 'A gummy bear.',
    );
    when(() => jokeRepository.getJokes()).thenAnswer((_) async => mockJoke);
    when(() => jokeRepository.loadShowedJokesIds()).thenAnswer((_) async => ['1','2']);
    when(() => jokeRepository.saveShowedJoke(any())).thenAnswer((_) async {});

    final joke = await jokeRepository.getJokes();
    expect(joke.id, mockJoke.id);
    expect(joke.setup, mockJoke.setup);
    expect(joke.delivery, mockJoke.delivery);

    final jokeShowedIds = await jokeRepository.loadShowedJokesIds();
    expect(jokeShowedIds, ['1','2']);
  });
}
