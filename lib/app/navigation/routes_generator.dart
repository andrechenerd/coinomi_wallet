import 'package:coinomi/app/navigation/routes.dart';
import 'package:coinomi/features/main/main_screen.dart';     
import 'package:coinomi/features/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../../features/splash/splash_screen.dart';

class RoutesGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          _getPage(settings),
    );
  }

  static Widget _getPage(RouteSettings settings) {
    // final args = (settings.arguments ?? {}) as Map;
    switch (settings.name) {
       case Routes.welcome:
        return const WelcomeScreenBuilder();
      case Routes.splash:
        return const SplashScreen();
      case Routes.main:
        return const MainScreenBuilder();
    }

    return const Scaffold(
      body: Center(
        child: Text("Page not found:("),
      ),
    );
  }
}
