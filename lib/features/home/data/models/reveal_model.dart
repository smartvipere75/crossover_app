import 'package:crossover_app/features/home/data/models/option_model.dart';
import 'package:crossover_app/features/home/domain/entities/reveal_entity.dart';

class RevealModel extends RevealEntity {
  RevealModel({int? id, List<OptionModel>? correctOptions})
      : super(id: id, correctOptions: correctOptions);

  factory RevealModel.fromJson(Map<String, dynamic> json) => RevealModel(
        id: json["id"],
        correctOptions: json["correct_options"] == null
            ? []
            : List<OptionModel>.from(
                json["correct_options"]?.map((x) => OptionModel.fromJson(x))),
      );
}
