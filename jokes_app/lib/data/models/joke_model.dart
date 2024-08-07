import 'package:freezed_annotation/freezed_annotation.dart';
part 'joke_model.g.dart';

@JsonSerializable(createToJson: false)
class JokeModel {
  bool? error;
  String? category;
  String? type;
  String? setup;
  String? delivery;
  FlagsModel? flags;
  int? id;
  bool? safe;
  String? lang;

  JokeModel({
    this.error,
    this.category,
    this.type,
    this.setup,
    this.delivery,
    this.flags,
    this.id,
    this.safe,
    this.lang,
  });

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      _$JokeModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class FlagsModel {
  bool? nsfw;
  bool? religious;
  bool? political;
  bool? racist;
  bool? sexist;
  bool? explicit;

  FlagsModel({
    this.nsfw,
    this.religious,
    this.political,
    this.racist,
    this.sexist,
    this.explicit,
  });

  factory FlagsModel.fromJson(Map<String, dynamic> json) =>
      _$FlagsModelFromJson(json);
}
