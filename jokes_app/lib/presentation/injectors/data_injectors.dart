//* Api
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/data/source/data_mapper/joke_data_mapper.dart';
import 'package:jokes_app/data/source/data_storage/data_storage.dart';
import 'package:jokes_app/data/source/joke_repository_impl.dart';
import 'package:jokes_app/data/source/network/api.dart';
import 'package:jokes_app/domain/repository/joke_repository.dart';

//* Data storage
final _dataStorage = Provider<DataStorage>((_) => DataStorage());

//* Api
final _apiProvider = Provider<Api>((ref) => Api.create(
      ref.read(_dataStorage),
    ));

//* DataMapper

final _jokeDataMapper = Provider<JokeDataMapper>((ref) => JokeDataMapper());

//* Repository

final jokeRepositoryProvider =
    Provider<JokeRepository>((ref) => JokeRepositoryImpl(
          ref.read(_apiProvider),
          ref.read(_jokeDataMapper),
        ));
