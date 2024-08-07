// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokeModel _$JokeModelFromJson(Map<String, dynamic> json) => JokeModel(
      error: json['error'] as bool?,
      category: json['category'] as String?,
      type: json['type'] as String?,
      setup: json['setup'] as String?,
      delivery: json['delivery'] as String?,
      flags: json['flags'] == null
          ? null
          : FlagsModel.fromJson(json['flags'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      safe: json['safe'] as bool?,
      lang: json['lang'] as String?,
    );

FlagsModel _$FlagsModelFromJson(Map<String, dynamic> json) => FlagsModel(
      nsfw: json['nsfw'] as bool?,
      religious: json['religious'] as bool?,
      political: json['political'] as bool?,
      racist: json['racist'] as bool?,
      sexist: json['sexist'] as bool?,
      explicit: json['explicit'] as bool?,
    );
