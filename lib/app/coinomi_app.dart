import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation/app_navigation.dart';
import 'navigation/routes.dart';
import 'navigation/routes_generator.dart';

final _navigatorKey = GlobalKey<NavigatorState>();



class CoinomiApp extends StatefulWidget {
  const CoinomiApp({super.key});

  @override
  State<CoinomiApp> createState() => _CoinomiAppState();
}

class _CoinomiAppState extends State<CoinomiApp> {
    final navigator = AppNavigator(_navigatorKey);
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider<AppNavigator>.value(
        value: navigator,
        child: WillPopScope(
          onWillPop: () {
            if (_navigatorKey.currentState?.canPop() ?? false) {
              _navigatorKey.currentState!.pop();
            }
            return Future.value(false);
          },
          child: Navigator(
            initialRoute: Routes.splash,
            key: _navigatorKey,
            onGenerateRoute: RoutesGenerator.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}