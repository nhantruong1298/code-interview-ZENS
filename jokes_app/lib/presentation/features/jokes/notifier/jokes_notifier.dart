// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:jokes_app/domain/entities/joke.dart';
import 'package:jokes_app/presentation/features/jokes/notifier/jokes_state.dart';
import 'package:jokes_app/presentation/injectors/data_injectors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'jokes_notifier.g.dart';

@riverpod
class JokesNotifier extends _$JokesNotifier {
  @override
  FutureOr<JokesState> build() {
    return const JokesState(status: JokesStatus.initial);
  }

  void onDislikeJoke(int? id) {
    if (id == null) return;
    onScreenInit();
  }

  void onLikeJoke(int? id) {
    if (id == null) return;
    onScreenInit();
  }

  Future<void> onScreenInit() async {
    state = const AsyncValue.data(JokesState(status: JokesStatus.loading));
    try {
      final joke = await _getJokes();
      await ref.read(jokeRepositoryProvider).saveShowedJoke(joke.id!);

      state =
          AsyncValue.data(JokesState(status: JokesStatus.loaded, joke: joke));
    } catch (error) {
      state = const AsyncValue.data(JokesState(status: JokesStatus.error));
    }
  }

  Future<Joke> _getJokes() async {
    final joke = await ref.read(jokeRepositoryProvider).getJokes();

    final showedJokesIds =
        await ref.read(jokeRepositoryProvider).loadShowedJokesIds();

    if (showedJokesIds.contains(joke.id.toString())) {
      return _getJokes();
    } else {
      return joke;
    }
  }
}
