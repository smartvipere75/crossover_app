import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFollowingHomeEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class LoadForYouHomeEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ChangeTabHomeEvent extends HomeEvent {
  final int tabIndex;

  ChangeTabHomeEvent({required this.tabIndex});

  @override
  List<Object?> get props => [tabIndex];
}

class RevealHomeEvent extends HomeEvent {
  final int id;

  RevealHomeEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
