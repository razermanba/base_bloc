import 'package:bloc/src/bloc.dart';

import 'package:bloc_base/core/bloc/event.dart';

import 'package:bloc_base/core/bloc/state.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../remote/repository/home_repository.dart';

class HomeBloc extends BaseBloc {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const InitialState());

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) {
    // TODO: implement handleEvent
    throw UnimplementedError();
  }

}