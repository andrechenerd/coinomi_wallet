import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/ui_components/dialogs/address_dialog.dart';
import 'package:coinomi/core/ui_components/dialogs/dapp_dialog.dart';
import 'package:coinomi/core/ui_components/other/button_with_icon.dart';
import 'package:flutter/material.dart';
import '../../../core/ui_components/dialogs/about_dialog.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      color: AppColors.transparent,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          ButtonWithIcon(
            color: AppColors.darkBlack.withOpacity(0.5),
            imagePath: AppIcons.addressBook,
            title: "Address book",
            onTap: () {
              showAppDialog(context, const AddressDialog());
            },
            iconHeight: 30,
          ),
          ButtonWithIcon(
            color: AppColors.darkBlack.withOpacity(0.5),
            imagePath: AppIcons.globus,
            title: "DApp Brwser",
            onTap: () {
              showAppDialog(context, const DappDialog());
            },
            iconHeight: 20,
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: AppColors.darkBlack.withOpacity(0.5),
            ),
          ),
          ButtonWithIcon(
            color: AppColors.darkBlack.withOpacity(0.5),
            imagePath: AppIcons.about,
            title: "About ",
            onTap: () {
              showAppDialog(context, const AboutDialogg());
            },
            iconHeight: 20,
          ),
          ButtonWithIcon(
            color: AppColors.darkBlack.withOpacity(0.5),
            imagePath: AppIcons.support,
            title: "Support",
            onTap: () {},
            iconHeight: 28,
          ),
          Container(
            width: 20,
            color: AppColors.darkBlack.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}

showAppDialog(BuildContext context, Widget widget) {
  showDialog(context: context, builder: (context) => widget);
}
