import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class BalanceWidget extends StatelessWidget {
  final double balance;
  const BalanceWidget({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      height: 125,
   
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.darkPrimary,
      ),
      child: Row(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppIcons.balance,
                height: 34,
              )),
          Align(
            alignment: Alignment.topCenter,
            child: const Text(
              "Balance",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.ligthGrey,
                fontWeight: FontWeight.w400,
              ),
            ).onlyPadding(top: 7),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              balance.toString(),
              style: const TextStyle(
                fontSize: 36,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "USD",
              style: TextStyle(
                fontSize: 36,
                color: AppColors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
