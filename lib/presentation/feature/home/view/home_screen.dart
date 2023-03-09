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
 }