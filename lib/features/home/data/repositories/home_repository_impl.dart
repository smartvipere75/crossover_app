import 'package:crossover_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:crossover_app/features/home/domain/entities/flashcard_entity.dart';
import 'package:crossover_app/features/home/domain/entities/mcq_entity.dart';
import 'package:crossover_app/features/home/domain/entities/reveal_entity.dart';
import 'package:crossover_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<FlashCardEntity> getFollowing() {
    return remoteDataSource.getFollowing();
  }

  @override
  Future<McqEntity> getForYou() {
    return remoteDataSource.getForYou();
  }

  @override
  Future<RevealEntity> reveal(int id) {
    return remoteDataSource.reveal(id);
  }
}
