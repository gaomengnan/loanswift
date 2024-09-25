import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/core/failure.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/data/models/home_data_model.dart';
import 'package:loanswift/features/domain/usecases/home/data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;

  Timer? _timer;

  HomeBloc(this.getHomeDataUseCase) : super(HomeInitial()) {
    on<HomeStarupEvent>(_homeStartUpHandler);
    on<HomeRefreshEvent>(_homeRefreshHandler);
  }

  void _homeRefreshHandler(event, emit) async {
    //emit(HomeRefreshLoading());

    final resp = await getHomeDataUseCase();

    resp.fold((l) {
      if (l is ConnectionFailure) {
        _startRefreshData();
      } else {
        _timer?.cancel();
        emit(HomeLoadFailure(CustomError(message: l.message)));
      }
    }, (r) {
      _timer?.cancel();
      emit(
        HomeLoadSuccess(homeData: r),
      );
    });
  }

  void _homeStartUpHandler(event, emit) async {
    emit(HomeLoading());
    final resp = await getHomeDataUseCase();

    resp.fold((l) {
      if (l is ConnectionFailure) {
        _startPollData();
      } else {
        emit(HomeLoadFailure(CustomError(message: l.message)));
        _timer?.cancel();
      }
    }, (r) {
      _timer?.cancel();
      GetStorage().write(AppContant.homeDataKey, r.toJson());
      emit(
        HomeLoadSuccess(homeData: r),
      );
      //final toMap = r.toMap();
      //final toJson = jsonEncode(toMap);
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // 关闭时取消定时器
    return super.close();
  }

  void _startPollData() {
    bool createdTimer = false;
    if (_timer == null) {
      createdTimer = true;
    }

    if (_timer != null && !_timer!.isActive) {
      createdTimer = true;
    }

    if (createdTimer) {
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        add(HomeStarupEvent());
      });
    }
  }

  void _startRefreshData() {
    bool createdTimer = false;
    if (_timer == null) {
      createdTimer = true;
    }

    if (_timer != null && !_timer!.isActive) {
      createdTimer = true;
    }

    if (createdTimer) {
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        add(HomeRefreshEvent());
      });
    }
  }
}
