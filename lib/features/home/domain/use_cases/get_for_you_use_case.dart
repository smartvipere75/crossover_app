import 'package:crossover_app/features/home/domain/entities/mcq_entity.dart';
import 'package:crossover_app/features/home/domain/repositories/home_repository.dart';

class GetForYouUseCase {
  final HomeRepository repo;

  GetForYouUseCase({required this.repo});

  Future<McqEntity> execute() {
    return repo.getForYou();
  }
}
