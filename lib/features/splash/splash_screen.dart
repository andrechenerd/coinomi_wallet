import 'package:coinomi/data/repositories/hive_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app/navigation/app_navigation.dart';
import '../../app/navigation/routes.dart';
import '../../core/constanats/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final navigator = context.read<AppNavigator>();
      final isFirstAppOpen = HiveRepo().isFirstAppOpen;
      navigator.pushNamedAndRemoveUntil(routeName: isFirstAppOpen ? Routes.welcome : Routes.main);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.transparent,
    );
  }
}
