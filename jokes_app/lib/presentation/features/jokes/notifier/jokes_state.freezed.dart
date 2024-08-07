// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jokes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JokesState {
  JokesStatus get status => throw _privateConstructorUsedError;
  Joke? get joke => throw _privateConstructorUsedError;
  List<String>? get showedJokesIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JokesStateCopyWith<JokesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JokesStateCopyWith<$Res> {
  factory $JokesStateCopyWith(
          JokesState value, $Res Function(JokesState) then) =
      _$JokesStateCopyWithImpl<$Res, JokesState>;
  @useResult
  $Res call({JokesStatus status, Joke? joke, List<String>? showedJokesIds});
}

/// @nodoc
class _$JokesStateCopyWithImpl<$Res, $Val extends JokesState>
    implements $JokesStateCopyWith<$Res> {
  _$JokesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? joke = freezed,
    Object? showedJokesIds = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JokesStatus,
      joke: freezed == joke
          ? _value.joke
          : joke // ignore: cast_nullable_to_non_nullable
              as Joke?,
      showedJokesIds: freezed == showedJokesIds
          ? _value.showedJokesIds
          : showedJokesIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JokesStateImplCopyWith<$Res>
    implements $JokesStateCopyWith<$Res> {
  factory _$$JokesStateImplCopyWith(
          _$JokesStateImpl value, $Res Function(_$JokesStateImpl) then) =
      __$$JokesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({JokesStatus status, Joke? joke, List<String>? showedJokesIds});
}

/// @nodoc
class __$$JokesStateImplCopyWithImpl<$Res>
    extends _$JokesStateCopyWithImpl<$Res, _$JokesStateImpl>
    implements _$$JokesStateImplCopyWith<$Res> {
  __$$JokesStateImplCopyWithImpl(
      _$JokesStateImpl _value, $Res Function(_$JokesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? joke = freezed,
    Object? showedJokesIds = freezed,
  }) {
    return _then(_$JokesStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JokesStatus,
      joke: freezed == joke
          ? _value.joke
          : joke // ignore: cast_nullable_to_non_nullable
              as Joke?,
      showedJokesIds: freezed == showedJokesIds
          ? _value._showedJokesIds
          : showedJokesIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$JokesStateImpl implements _JokesState {
  const _$JokesStateImpl(
      {required this.status, this.joke, final List<String>? showedJokesIds})
      : _showedJokesIds = showedJokesIds;

  @override
  final JokesStatus status;
  @override
  final Joke? joke;
  final List<String>? _showedJokesIds;
  @override
  List<String>? get showedJokesIds {
    final value = _showedJokesIds;
    if (value == null) return null;
    if (_showedJokesIds is EqualUnmodifiableListView) return _showedJokesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'JokesState(status: $status, joke: $joke, showedJokesIds: $showedJokesIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JokesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.joke, joke) || other.joke == joke) &&
            const DeepCollectionEquality()
                .equals(other._showedJokesIds, _showedJokesIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, joke,
      const DeepCollectionEquality().hash(_showedJokesIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JokesStateImplCopyWith<_$JokesStateImpl> get copyWith =>
      __$$JokesStateImplCopyWithImpl<_$JokesStateImpl>(this, _$identity);
}

abstract class _JokesState implements JokesState {
  const factory _JokesState(
      {required final JokesStatus status,
      final Joke? joke,
      final List<String>? showedJokesIds}) = _$JokesStateImpl;

  @override
  JokesStatus get status;
  @override
  Joke? get joke;
  @override
  List<String>? get showedJokesIds;
  @override
  @JsonKey(ignore: true)
  _$$JokesStateImplCopyWith<_$JokesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
