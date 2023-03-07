import 'package:bloc/src/bloc.dart';
import 'package:bloc_base/core/bloc/base_bloc.dart';
import 'package:bloc_base/core/bloc/event.dart';
import 'package:bloc_base/core/bloc/state.dart';

import 'login_event.dart';

class LoginBloc extends BaseBloc {
  final LoginRepository _loginRepository;
  String userName = "";
  String password = "";

  LoginBloc(this._loginRepository) : super(const InitialState());

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) {
    if (event is LoginUserNameChanged) {
      userName = event.username;
    } else if (event is LoginPasswordChanged) {
      password = event.password;
    } else if (event is LoginSubmitted) {
      await safeDataCall(
          emit,
          callToHost:
          _loginRepository:performLogin(LoginRequest("0987654321", "123456")),
    success: (Emitter<BaseState> emit, LoginResponse? data) {
    Fimber.e("login success data - ${data?.token}");
    hideDialogState();
    token = data?.token ?? "";
    navigationService.pushAndRemoveUntil(
    const HomeScreenRoute(),
    predicate: (route) => false,
    );
    },
    );
  }
  }
}
