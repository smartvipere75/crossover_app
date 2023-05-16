import 'package:crossover_app/features/home/domain/entities/option_entity.dart';

class OptionModel extends OptionEntity {
  OptionModel({String? id, String? answer}) : super(id: id, answer: answer);

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      OptionModel(id: json["id"], answer: json["answer"]);
}
