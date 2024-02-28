import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:coinomi/core/ui_components/dialogs/restore_wallet_dialog.dart';
import 'package:coinomi/core/ui_components/other/app_button.dart';
import 'package:flutter/material.dart';

import '../../constanats/app_colors.dart';

class ManageWalletDialog extends StatelessWidget {
  const ManageWalletDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 2,
        decoration: const BoxDecoration(
          color: AppColors.secondaryDark,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  AppIcons.close,
                  height: 30,
                )
                    .align(
                      alignment: Alignment.centerRight,
                    )
                    .onlyPadding(top: 12, right: 12)),
            Row(
              children: [
                Image.asset(
                  AppIcons.keys,
                  height: 34,
                ),
                const Text(
                  "Manage Wallets",
                  style: TextStyle(
                    fontSize: 36,
                    color: AppColors.ligthGrey,
                  ),
                ).onlyPadding(left: 10),
              ],
            ).onlyPadding(left: 40),
            const Spacer(),
            const Text(
              "Default Walet",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ).onlyPadding(
              left: 40,
            ),
            const Spacer(),
            AppButton(
              text: "Create a new wallet",
              onTap: () {},
              bgColor: AppColors.green,
              horizontalMargin: 60,
            ),
            const SizedBox(
              height: 10,
            ),
            AppButton(
              text: "Restore",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => RestoreWalletDialog(
                    onImport: (p0) {
                      Navigator.pop(p0);
                    },
                  ),
                );
              },
              bgColor: AppColors.blue,
              horizontalMargin: 60,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
