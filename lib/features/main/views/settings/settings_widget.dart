import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:coinomi/core/ui_components/dialogs/manage_wallets_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../core/constanats/app_colors.dart';
import 'components/dropdown_button.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Settings",
            style: TextStyle(
              fontSize: 36,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ).align(alignment: Alignment.centerLeft),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.darkPrimary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppIcons.currency,
                          height: 28,
                        ),
                        const Text(
                          "Default currency",
                          style:
                              TextStyle(fontSize: 16, color: AppColors.white),
                        ).onlyPadding(left: 12),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 24),
                      height: 1,
                      color: AppColors.darkGrey,
                    ),
                    const DropdownBurronWidget(
                      dropdownItems: ["US Dollar"],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppIcons.notification,
                          height: 31,
                        ),
                        const Text(
                          "Notifications",
                          style:
                              TextStyle(fontSize: 16, color: AppColors.white),
                        ).onlyPadding(left: 12),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 24),
                      height: 1,
                      color: AppColors.darkGrey,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const DropdownBurronWidget(
                          dropdownItems: ["On", "Off"],
                        ),
                        Expanded(
                          child: const Text(
                            "Your wallet valuation will be displayed in this currency.",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16, color: AppColors.ligthGrey),
                          ).onlyPadding(left: 20, bottom: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppIcons.keys,
                          height: 30,
                        ),
                        const Text(
                          "Manage wallet",
                          style:
                              TextStyle(fontSize: 16, color: AppColors.white),
                        ).onlyPadding(left: 12),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 24),
                      height: 1,
                      color: AppColors.darkGrey,
                    ),
                    GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (context)=>const ManageWalletDialog());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 38,
                        width: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: const Color(0xffA686ce)),
                        child: const Text(
                          "Manage Wallets",
                          style: TextStyle(fontSize: 16, color: AppColors.white),
                        ),
                      ).onlyPadding(left: 40),
                    )
                  ],
                ),
              ).onlyPadding(top: 40).expanded(),
            ],
          )
        ],
      ),
    );
  }
}
