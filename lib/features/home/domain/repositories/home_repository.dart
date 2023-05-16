import 'package:crossover_app/features/home/domain/entities/flashcard_entity.dart';
import 'package:crossover_app/features/home/domain/entities/mcq_entity.dart';
import 'package:crossover_app/features/home/domain/entities/reveal_entity.dart';

abstract class HomeRepository {
  Future<FlashCardEntity> getFollowing();
  Future<McqEntity> getForYou();
  Future<RevealEntity> reveal(int id);
}
