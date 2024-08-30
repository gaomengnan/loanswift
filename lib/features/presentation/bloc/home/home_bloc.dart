import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/data/models/home_data_model.dart';
import 'package:loanswift/features/domain/usecases/home/data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  HomeBloc(this.getHomeDataUseCase) : super(HomeInitial()) {
    on<HomeStarupEvent>(_homeStartUpHandler);

    on<HomeRefreshEvent>(_homeRefreshHandler);
  }

  void _homeRefreshHandler(event, emit) async {
    //emit(HomeRefreshLoading());

    final resp = await getHomeDataUseCase();

    resp.fold((l) {
      emit(HomeLoadFailure(CustomError(error: l.message)));
    }, (r) {
      emit(
        HomeLoadSuccess(homeData: r),
      );
    });
  }

  void _homeStartUpHandler(event, emit) async {
    emit(HomeLoading());
    final resp = await getHomeDataUseCase();

    resp.fold((l) {
      emit(HomeLoadFailure(CustomError(error: l.message)));
    }, (r) {
      emit(
        HomeLoadSuccess(homeData: r),
      );
    });
  }
}
