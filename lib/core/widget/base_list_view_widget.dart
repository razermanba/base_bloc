import 'package:flutter/material.dart';

import '../bloc/base_bloc.dart';
import '../bloc/state.dart';
import 'base_widget.dart';
import 'shimmer_loading.dart';
import './navigation_drawer_widget.dart';

abstract class BaseListView<B extends BaseBloc, M> extends BaseView<B> {
  const BaseListView({super.key});

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: buildAppBar(context),
      // body: bodyView(context, state),

      body: Shimmer(
        linearGradient: _shimmerGradient,
        child: bodyView(context, state),
      ),
    );
  }

  Widget bodyView(BuildContext context, BaseState state) {
    if (state is InitialState || state is LoadingViewState) {
      // return loadingView(context);

      return ShimmerLoading(isLoading: true, child: loadingView(context));
    } else if (state is SuccessState) {
      var dataList = state.data;
      if (dataList is List<M>) {
        // return successView(context, dataList);

        return ShimmerLoading(
            isLoading: false, child: successView(context, dataList));
      } else {
        return errorView(context, "Data invalid");
      }
    } else if (state is ErrorViewState) {
      return errorView(context, state.message);
    }
    return Container();
  }

  Widget successView(BuildContext context, List<M> data) {
    return ListView.builder(
      itemBuilder: (context, index) => itemListView(context, data[index]),
      itemCount: data.length,
    );
  }

  Widget itemListView(BuildContext context, M object) {
    return Container();
  }

  Widget loadingView(BuildContext context) {
    return Container();

    // return SizedBox(
    //   height: MediaQuery.of(context).size.height / 1.3,
    //   child: const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
  }

  Widget errorView(BuildContext context, String? message) {
    return Text(message ?? "Error");
  }

  AppBar? buildAppBar(BuildContext context) {
    return null;
  }
}

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);


