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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          const SizedBox(height: 60),
          Image.asset('assets/AppIcon/Icon-App-83.5x83.5@2x.png'),
          const SizedBox(height: 30),
          const Text(
            '＼登録済みの方はこちら／',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 20),
          TextField(
              onChanged: (text) {
                final bloc = BlocProvider.of<LoginBloc>(context);
                bloc.add(LoginUserNameChanged(text));
              },
              scrollPadding: const EdgeInsets.all(20.0),
              decoration: InputDecoration(
                hintText: "ユーザーID(6桁の番号)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: const BorderSide(
                    width: 0.2,
                    style: BorderStyle.none,
                  ),
                ),
              )),
          const SizedBox(height: 0),
          TextField(
              onChanged: (text) {
                final bloc = BlocProvider.of<LoginBloc>(context);
                bloc.add(LoginPasswordChanged(text));
              },
              scrollPadding: const EdgeInsets.all(20.0),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "パスワード",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: const BorderSide(
                    width: 0.2,
                    style: BorderStyle.none,
                  ),
                ),
              )),
          const SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // <-- Radius
                ),
              ),
              onPressed: () {
                final bloc = BlocProvider.of<LoginBloc>(context);
                bloc.add(LoginSubmitted());
              },
              child: const Text("ログイン")
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {
              // final bloc = BlocProvider.of<LoginBloc>(context);
              // bloc.add(LoginSubmitted());
            },
            child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "パスワードをお忘れの方はこちら",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.blue, fontSize: 13),
                )),
          ),
        ]));
  }

  @override
  createBloc() {
    return LoginBloc(locator<LoginRepository>());
  }
}
