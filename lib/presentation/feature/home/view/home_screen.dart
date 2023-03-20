import 'package:flutter/material.dart';

import '../../../../core/widget/base_list_view_widget.dart';
import '../../../../di/locator.dart';
import '../bloc/home_bloc.dart';
import '../model/home_response.dart';
import '../remote/repository/home_repository.dart';

class HomeScreen extends BaseListView<HomeBloc, HomeResponse> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeBloc createBloc() {
    return HomeBloc(locator<HomeRepository>());
  }

  @override
  Widget itemListView(BuildContext context, HomeResponse object) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(object.title ?? "",
              style: const TextStyle(color: Colors.red, fontSize: 16)),
          Text(object.description ?? "",
              style: const TextStyle(color: Colors.black, fontSize: 14))
        ],
      ),
    );
  }

  @override
  AppBar? buildAppBar(BuildContext context) => AppBar(
        title: const Text("Home Screen"),
      );

  @override
  Widget loadingView(BuildContext context) {
    return Column(
      children: [
        for (int x = 0; x < 2; x++) ...[
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 16,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16)),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 14,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16)),
                )
              ],
            ),
          )
        ],
      ],
    );
  }
}
