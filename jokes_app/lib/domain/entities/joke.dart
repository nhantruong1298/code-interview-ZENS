import 'package:jokes_app/domain/entities/flags.dart';

class Joke {
  final bool? error;
  final String? category;
  final String? type;
  final String? setup;
  final String? delivery;
  final Flags? flags;
  final int? id;
  final bool? safe;
  final String? lang;

  Joke(
      {this.error,
      this.category,
      this.type,
      this.setup,
      this.delivery,
      this.flags,
      this.id,
      this.safe,
      this.lang});
}
