import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/constanats/app_images.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:coinomi/features/main/components/tab_item.dart';
import 'package:coinomi/features/main/cubit.dart';
import 'package:coinomi/features/main/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/ui_components/other/button_with_icon.dart';

class AppMenu extends StatefulWidget {
  const AppMenu({super.key});

  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  late MainScreenCubit cubit;

  @override
  void initState() {
    cubit = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
        bloc: cubit,
        builder: (context, state) {
          return Container(
            color: AppColors.secondaryDark,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  AppImages.appLogo,
                  height: 116,
                ),
                const Text(
                  'coinomi',
                  style: TextStyle(
                      fontSize: 30,
                      color: AppColors.ligthGrey,
                      fontWeight: FontWeight.w500),
                ),
                const Text(
                  'Default wallet',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.ligthGrey,
                  ),
                ).onlyPadding(top: 7),
                const Spacer(),
                TabItem(
                  imagePath: cubit.state.selectedIndex == 0
                      ? AppIcons.activeOverview
                      : AppIcons.overview,
                  title: "Overview",
                  isSelected: cubit.state.selectedIndex == 0 ? true : false,
                  onTap: () => cubit.onSelectTab(0),
                ),
                TabItem(
                  imagePath: cubit.state.selectedIndex == 1
                      ? AppIcons.activeWallet
                      : AppIcons.wallet,
                  title: "Wallet",
                  isSelected: cubit.state.selectedIndex == 1 ? true : false,
                  onTap: () => cubit.onSelectTab(1),
                ),
                const Spacer(
                  flex: 5,
                ),
                ButtonWithIcon(
                  color: AppColors.darkBlack,
                  imagePath: AppIcons.settings,
                  title: "Settings",
                  onTap: () => cubit.onSelectTab(2),
                )
              ],
            ),
          );
        });
  }
}
