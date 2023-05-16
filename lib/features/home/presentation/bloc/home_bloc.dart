import 'dart:async';

import 'package:crossover_app/features/home/domain/use_cases/get_following_use_case.dart';
import 'package:crossover_app/features/home/domain/use_cases/get_for_you_use_case.dart';
import 'package:crossover_app/features/home/domain/use_cases/reveal_use_case.dart';
import 'package:crossover_app/features/home/presentation/bloc/home_event.dart';
import 'package:crossover_app/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetFollowingUseCase _getFollowingUseCase;
  final GetForYouUseCase _getForYouUseCase;
  final RevealUseCase _revealUseCase;

  HomeBloc(
      this._getFollowingUseCase, this._getForYouUseCase, this._revealUseCase)
      : super(HomeLoadingState()) {
    on<LoadFollowingHomeEvent>(_onLoadFollowing);
    on<LoadForYouHomeEvent>(_onLoadForYou);
    on<ChangeTabHomeEvent>(_onChangeTab);
    on<RevealHomeEvent>(_onReveal);
  }

  FutureOr<void> _onLoadFollowing(HomeEvent event, Emitter emit) async {
    final following = await _getFollowingUseCase.execute();
    emit(HomeLoadedState(
        tabIndex: state.tabIndex,
        following: state.following + [following],
        forYou: state.forYou,
        correctOptions: state.correctOptions));
  }

  FutureOr<void> _onLoadForYou(HomeEvent event, Emitter emit) async {
    final forYou = await _getForYouUseCase.execute();
    emit(HomeLoadedState(
        tabIndex: state.tabIndex,
        following: state.following,
        forYou: state.forYou + [forYou],
        correctOptions: state.correctOptions));
  }

  FutureOr<void> _onChangeTab(ChangeTabHomeEvent event, Emitter emit) async {
    if (state is HomeLoadedState) {
      final state = this.state as HomeLoadedState;
      emit(HomeLoadedState(
          tabIndex: event.tabIndex,
          following: state.following,
          forYou: state.forYou,
          correctOptions: state.correctOptions));
    }
  }

  FutureOr<void> _onReveal(RevealHomeEvent event, Emitter emit) async {
    final reveal = await _revealUseCase.execute(event.id);
    emit(HomeLoadedState(
        tabIndex: state.tabIndex,
        following: state.following,
        forYou: state.forYou,
        correctOptions: reveal.correctOptions ?? []));
  }
}
