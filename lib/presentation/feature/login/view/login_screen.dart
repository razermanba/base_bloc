import 'package:bloc_base/core/widget/base_widget.dart';
import 'package:bloc_base/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/state.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../remote/repository/login_repository.dart';

class LoginScreen extends BaseView<LoginBloc> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login screen"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
              onChanged: (text) {
                final bloc = BlocProvider.of<LoginBloc>(context);
                bloc.add(LoginUserNameChanged(text));
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Username",
              )),
          const SizedBox(height: 20),
          TextField(
              onChanged: (text) {
                final bloc = BlocProvider.of<LoginBloc>(context);
                bloc.add(LoginPasswordChanged(text));
              },
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              )),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                final bloc = BlocProvider.of<LoginBloc>(context);
                bloc.add(LoginSubmitted());
              },
              child: const Text("Login")
          )
        ])
    );
  }

  @override
  createBloc() {
    return LoginBloc(locator<LoginRepository>());
  }

}





