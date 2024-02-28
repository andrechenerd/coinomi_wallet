import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constanats/app_colors.dart';

class CryptoWidget extends StatelessWidget {
  final String imagePath;
  final double priceDollar;
  final double priceCrypto;
  final double procent;
  final Color color;
  final String coinName;
  final String coinShortName;
  const CryptoWidget(
      {super.key,
      required this.imagePath,
      required this.priceDollar,
      required this.priceCrypto,
      required this.procent,
      required this.color,
      required this.coinName,
      required this.coinShortName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 60,
      color: AppColors.transparent,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(imagePath),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coinName,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white),
              ),
              const Spacer(),
              Text(
                "= $priceDollar USD",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ligthGrey),
              ),
            ],
          ).onlyPadding(left: 12,top: 4,bottom: 4),
          const Spacer(),
          Text(
            "$priceCrypto $coinShortName",
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.ligthGrey),
          ),
          const Spacer(),
          const Text(
            "0.00 USD",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.white),
          ),
          const Spacer(),
          Text(
            "%$procent $coinShortName",
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.ligthGrey),
          ),
          Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              )).onlyPadding(left: 10)
        ],
      ),
    );
  }
}
