import 'package:crossover_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:crossover_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:crossover_app/features/home/domain/repositories/home_repository.dart';
import 'package:crossover_app/features/home/domain/use_cases/get_following_use_case.dart';
import 'package:crossover_app/features/home/domain/use_cases/get_for_you_use_case.dart';
import 'package:crossover_app/features/home/domain/use_cases/reveal_use_case.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton(() => GetFollowingUseCase(repo: locator()));
  locator.registerLazySingleton(() => GetForYouUseCase(repo: locator()));
  locator.registerLazySingleton(() => RevealUseCase(repo: locator()));
  locator.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton(() => HomeRemoteDataSource());
}
