import 'package:crossover_app/features/home/domain/entities/option_entity.dart';
import 'package:crossover_app/features/home/domain/entities/user_entity.dart';

class McqEntity {
  String? type;
  int? id;
  String? playlist;
  String? description;
  String? question;
  List<OptionEntity>? options;
  UserEntity? user;

  McqEntity({
    this.type,
    this.id,
    this.playlist,
    this.description,
    this.question,
    this.options,
    this.user,
  });
}
