import 'package:auto_route/auto_route.dart';
import 'package:bloc_base/presentation/routers/router.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationService {
  final AppRouter _router;

  NavigationService(this._router);

  Future push<T>(PageRouteInfo routeInfo) async {
    try {
      return _router.push(routeInfo);
    } on Exception catch (e) {
      Fimber.e('Exception occurred in navigateTo: $e');
    }
  }

  Future popAndPush(PageRouteInfo routeInfo) async {
    try {
      return _router.popAndPush(routeInfo);
    } on Exception catch (e) {
      Fimber.e('Exception occurred in navigateTo: $e');
    }
  }

  Future pushAndRemoveUntil(
    PageRouteInfo routeInfo, {
    required RoutePredicate predicate,
  }) async {
    try {
      return _router.pushAndPopUntil(routeInfo, predicate: predicate);
    } on Exception catch (e) {
      Fimber.e('Exception occurred in navigateTo: $e');
    }
  }

  Future<bool> pop() {
    try{
      return _router.pop();
    } on Exception catch(e) {
      Fimber.e('Exception occurred in pop: $e');
      return Future.value(false);
    }
  }

  void popToRoot() {
    try{
      return _router.popUntil((route) => route.isFirst);
    } on Exception catch(e) {
      Fimber.e('Exception occurred in pop: $e');
    }
  }
}



















