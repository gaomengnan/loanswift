part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeLoadEvent extends HomeEvent {}

class HomeLoadingEvent extends HomeEvent {}

class HomeLoadedEvent extends HomeEvent {}

class HomeLoadFailure extends HomeEvent {
  final CustomError error;
  HomeLoadFailure({required this.error});
}

