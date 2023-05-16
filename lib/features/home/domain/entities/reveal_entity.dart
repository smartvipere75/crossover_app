import 'package:crossover_app/features/home/domain/entities/option_entity.dart';

class RevealEntity {
  int? id;
  List<OptionEntity>? correctOptions;

  RevealEntity({
    this.id,
    this.correctOptions,
  });
}
