import 'package:flutter/material.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> _navigatorKey;

  AppNavigator(this._navigatorKey);

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>({
    required String routeName,
    TO? result,
    Object? args,
  }) {
    return _navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      result: result,
      arguments: args,
    );
  }

  Future<T?> pushNamed<T extends dynamic>(
      {required String routeName, Object? args}) {
    return _navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: args,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends dynamic>(
      {required String routeName, Object? args}) {
    return _navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (_) => false,
      arguments: args,
    );
  }

  void pop<T extends dynamic>([T? result]) {
    return _navigatorKey.currentState!.pop(result);
  }

  bool canPop() {
    return _navigatorKey.currentState!.canPop();
  }
}
