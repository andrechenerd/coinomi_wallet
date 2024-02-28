import 'package:coinomi/app/navigation/app_navigation.dart';
import 'package:coinomi/app/navigation/routes.dart';
import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/constanats/app_images.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:coinomi/core/ui_components/dialogs/restore_wallet_dialog.dart';
import 'package:coinomi/core/ui_components/other/app_button.dart';
import 'package:coinomi/data/repositories/hive_repo.dart';
import 'package:coinomi/features/main/main_screen.dart';
import 'package:coinomi/features/welcome/components/create_wallet_dialog.dart';
import 'package:coinomi/features/welcome/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreenBuilder extends StatelessWidget {
  const WelcomeScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit(),
      child: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final WelcomeCubit cubit;

  @override
  void initState() {
    cubit = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryDark,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Spacer(
                flex: 5,
              ),
              Image.asset(
                AppImages.appLogo,
                height: 165,
              ),
              const Text(
                "coinomi",
                style: TextStyle(
                    fontSize: 50, color: AppColors.ligthGrey, letterSpacing: 0),
              ),
              const Spacer(
                flex: 3,
              ),
              const Text(
                "Welcome to Coinomi",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 36,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0),
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  AppButton(
                    text: "Create a new wallet",
                    onTap: () {
                      cubit.createWallet(
                        () {
                          showDialog(
                            context: context,
                            builder: (context) => BlocProvider.value(
                              value: cubit,
                              child: const CreateWalletDialog(),
                            ),
                          );
                        },
                      );
                      // context
                    },
                    bgColor: AppColors.green,
                  ).expanded(),
                  AppButton(
                    text: "Restore a wallet",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => RestoreWalletDialog(
                          onImport: (p0) {
                            Navigator.pop(p0);
                            HiveRepo().setIsNotFirstAppOpen();
                            Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const MainScreenBuilder(),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                      );
                    },
                    bgColor: AppColors.blue,
                  ).expanded(),
                ],
              ).symmetricPadding(
                  horizontal: MediaQuery.of(context).size.width / 5),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
