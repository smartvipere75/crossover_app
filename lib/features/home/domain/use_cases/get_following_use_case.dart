import 'package:crossover_app/features/home/domain/entities/flashcard_entity.dart';
import 'package:crossover_app/features/home/domain/repositories/home_repository.dart';

class GetFollowingUseCase {
  final HomeRepository repo;

  GetFollowingUseCase({required this.repo});

  Future<FlashCardEntity> execute() {
    return repo.getFollowing();
  }
}
