import 'package:crossover_app/features/home/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({String? name, String? avatar}) : super(name: name, avatar: avatar);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(name: json["name"], avatar: json["avatar"]);
}
