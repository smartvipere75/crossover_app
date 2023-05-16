import 'package:crossover_app/features/home/domain/entities/user_entity.dart';

class FlashCardEntity {
  String? type;
  int? id;
  String? playlist;
  String? flashcardFront;
  String? flashcardBack;
  String? description;
  UserEntity? user;

  FlashCardEntity({
    this.type,
    this.id,
    this.playlist,
    this.flashcardFront,
    this.flashcardBack,
    this.description,
    this.user,
  });
}
