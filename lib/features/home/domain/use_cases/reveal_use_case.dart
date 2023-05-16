import 'package:crossover_app/features/home/domain/entities/reveal_entity.dart';
import 'package:crossover_app/features/home/domain/repositories/home_repository.dart';

class RevealUseCase {
  final HomeRepository repo;

  RevealUseCase({required this.repo});

  Future<RevealEntity> execute(int id) {
    return repo.reveal(id);
  }
}
