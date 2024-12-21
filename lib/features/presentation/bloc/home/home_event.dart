part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeStarupEvent extends HomeEvent {}

class HomeRefreshEvent extends HomeEvent {}

class LoadNotifyMessage extends HomeEvent {}
