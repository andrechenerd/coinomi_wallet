import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

import '../../constanats/app_colors.dart';

class AddressDialog extends StatelessWidget {
  const AddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2.5,
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
                  AppIcons.addressBook,
                  height: 34,
                ),
                const Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 36,
                    color: AppColors.ligthGrey,
                  ),
                ).onlyPadding(left: 10),
              ],
            ).onlyPadding(left: 40),
            const Text(
              "No addresses saved",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ).onlyPadding(left: 40, top: 40),
          ],
        ),
      ),
    );
  }
}
