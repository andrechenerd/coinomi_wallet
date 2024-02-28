import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:coinomi/features/main/components/menu.dart';
import 'package:coinomi/features/main/state.dart';
import 'package:coinomi/features/main/views/overview/overview_widget.dart';
import 'package:coinomi/features/main/views/settings/settings_widget.dart';
import 'package:coinomi/features/main/views/wallet/wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constanats/app_colors.dart';
import 'components/bottom_navbar.dart';
import 'cubit.dart';

class MainScreenBuilder extends StatelessWidget {
  const MainScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MainScreenCubit(), child: const MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MainScreenCubit cubit;
  @override
  void initState() {
    cubit = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MainScreenCubit, MainScreenState>(
          bloc: cubit,
          builder: (context, state) {
            return Scaffold(
                backgroundColor: AppColors.darkLigth,
                body: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const AppMenu().expanded(flex: 3),
                      Column(
                        children: [
                          cubit.state.selectedIndex == 0
                              ? const OverviewWidget().expanded(flex: 9)
                              : cubit.state.selectedIndex == 1
                                  ? const WalletWidget().expanded(flex: 9)
                                  : const SettingsWidget().expanded(flex: 9),
                                    const BottomNavbarWidget()
                          .align(alignment: Alignment.bottomCenter)
                        ],
                      ).expanded(flex: 9),
                    ],
                  ),
                ));
          }),
    );
  }
}
