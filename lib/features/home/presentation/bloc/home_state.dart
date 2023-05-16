import 'package:crossover_app/features/home/domain/entities/flashcard_entity.dart';
import 'package:crossover_app/features/home/domain/entities/mcq_entity.dart';
import 'package:crossover_app/features/home/domain/entities/option_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  final int tabIndex;
  final List<FlashCardEntity> following;
  final List<McqEntity> forYou;
  final List<OptionEntity> correctOptions;

  const HomeState(
      {this.tabIndex = 0,
      this.following = const [],
      this.forYou = const [],
      this.correctOptions = const []});

  @override
  List<Object?> get props => [tabIndex, following, forYou, correctOptions];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  const HomeLoadedState(
      {required tabIndex,
      required following,
      required forYou,
      required correctOptions})
      : super(
            tabIndex: tabIndex,
            following: following,
            forYou: forYou,
            correctOptions: correctOptions);
}
