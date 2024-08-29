import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/domain/usecases/home/data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase useCase;
  HomeBloc({
    required this.useCase,
  }) : super(
          HomeInit(),
        ) {
    on<HomeLoadEvent>(_homeLoadHandler);
  }

  void _homeLoadHandler(HomeLoadEvent event, Emitter<HomeState> emit) {}
}
