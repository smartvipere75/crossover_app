import 'package:crossover_app/features/home/data/models/user_model.dart';
import 'package:crossover_app/features/home/domain/entities/flashcard_entity.dart';

class FlashCardModel extends FlashCardEntity {
  FlashCardModel(
      {String? type,
      int? id,
      String? playlist,
      String? flashcardFront,
      String? flashcardBack,
      String? description,
      UserModel? user})
      : super(
            type: type,
            id: id,
            playlist: playlist,
            flashcardFront: flashcardFront,
            flashcardBack: flashcardBack,
            description: description,
            user: user);

  factory FlashCardModel.fromJson(Map<String, dynamic> json) {
    return FlashCardModel(
      type: json["type"],
      id: json["id"],
      playlist: json["playlist"],
      flashcardFront: json["flashcard_front"],
      flashcardBack: json["flashcard_back"],
      description: json["description"],
      user: UserModel.fromJson(json["user"]),
    );
  }
}
