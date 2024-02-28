import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

import '../../constanats/app_colors.dart';

class DappDialog extends StatelessWidget {
  const DappDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
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
                  AppIcons.globus,
                  height: 34,
                ),
                const Text(
                  "No DApp enabled account",
                  style: TextStyle(
                    fontSize: 36,
                    color: AppColors.ligthGrey,
                  ),
                ).onlyPadding(left: 10),
              ],
            ).onlyPadding(left: 40),
            const Text(
              "You must have at least one DApp enabled account to use the DApp Browser",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ).onlyPadding(left: 40, top: 40, right: 40),
            const Spacer(),
            GestureDetector(
              onTap: ()=>Navigator.pop(context),
              child: Container(
                alignment: Alignment.center,
                height: 53,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.white,
                ),
                child: const Text(
                  "OK",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBlack),
                ),
              ).align(alignment: Alignment.center).onlyPadding(bottom: 40),
            )
          ],
        ),
      ),
    );
  }
}
