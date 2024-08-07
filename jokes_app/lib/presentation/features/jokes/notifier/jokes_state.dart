import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jokes_app/domain/entities/joke.dart';
part 'jokes_state.freezed.dart';

enum JokesStatus {
  initial,
  loading,
  loaded,
  error,
}

@Freezed(copyWith: true)
class JokesState with _$JokesState {
  const factory JokesState({
    required JokesStatus status,
    Joke? joke,
    List<String>? showedJokesIds,
  }) = _JokesState;
}
