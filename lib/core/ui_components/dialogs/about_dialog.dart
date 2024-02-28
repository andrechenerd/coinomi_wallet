import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/constanats/app_images.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

import '../../constanats/app_colors.dart';

class AboutDialogg extends StatelessWidget {
  const AboutDialogg({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width / 2,
        decoration: const BoxDecoration(
          color: AppColors.secondaryDark,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Image.asset(
              AppImages.appLogo,
              height: 114,
            ),
            const Text(
              "coinomi",
              style: TextStyle(
                fontSize: 36,
                color: AppColors.ligthGrey,
              ),
            ).onlyPadding(top: 4),
            const Spacer(),
            const Text(
              "v1.3.0",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Build 22 | core220",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.white.withOpacity(0.1),
                fontWeight: FontWeight.w700,
              ),
            ).onlyPadding(top: 3),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pop(context),
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
