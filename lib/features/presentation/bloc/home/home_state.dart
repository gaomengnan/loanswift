part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  final HomeDataModel homeData;

  const HomeState({required this.homeData});

  @override
  List<Object?> get props => [homeData];
}

class HomeInitial extends HomeState {
  HomeInitial() : super(homeData: HomeDataModel.empty());
}

class HomeLoading extends HomeState {
  HomeLoading() : super(homeData: HomeDataModel.empty());
}

class HomeRefreshLoading extends HomeState {
  HomeRefreshLoading() : super(homeData: HomeDataModel.empty());
}

class HomeRefreshSuccess extends HomeState {
  const HomeRefreshSuccess({required super.homeData});
}

class HomeLoadSuccess extends HomeState {
  const HomeLoadSuccess({required super.homeData});
}

class HomeLoadFailure extends HomeState {
  final CustomError error;

  HomeLoadFailure(this.error) : super(homeData: HomeDataModel.empty());
  @override
  List<Object?> get props => [error, homeData];
}
