import 'package:crossover_app/features/home/data/models/option_model.dart';
import 'package:crossover_app/features/home/data/models/user_model.dart';
import 'package:crossover_app/features/home/domain/entities/mcq_entity.dart';

class McqModel extends McqEntity {
  McqModel(
      {String? type,
      int? id,
      String? playlist,
      String? description,
      String? question,
      List<OptionModel>? options,
      UserModel? user})
      : super(
            type: type,
            id: id,
            playlist: playlist,
            description: description,
            question: question,
            options: options,
            user: user);

  factory McqModel.fromJson(Map<String, dynamic> json) {
    return McqModel(
      type: json["type"],
      id: json["id"],
      playlist: json["playlist"],
      description: json["description"],
      question: json["question"],
      options: List<OptionModel>.from(
          json["options"]?.map((x) => OptionModel.fromJson(x))),
      user: UserModel.fromJson(json["user"]),
    );
  }
}
