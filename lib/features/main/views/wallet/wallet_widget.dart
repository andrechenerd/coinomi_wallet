import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/Coin_icon.png",
                height: 60,
              ),
              const Text(
                "Bitcoin",
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              )
                  .symmetricPadding(horizontal: 12)
                  .align(alignment: Alignment.centerLeft),
              const Text(
                "BTC",
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.white,
                  fontWeight: FontWeight.w300,
                ),
              ).align(alignment: Alignment.centerLeft),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: 60,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "1 BTC ≈ 42,911.881159572 USD",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.ligthGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Height: 828608",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.ligthGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ).onlyPadding(right: 12),
              ),
              Container(
                height: 60,
                width: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.darkGrey,
                ),
                child: Image.asset(
                  AppIcons.arrowDown,
                  width: 34,
                ),
              )
            ],
          ),
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
                          AppIcons.balance,
                          height: 32,
                        ),
                        const Text(
                          "Balance",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.ligthGrey,
                            fontWeight: FontWeight.w400,
                          ),
                        ).onlyPadding(left: 12),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "0",
                            style: TextStyle(
                              fontSize: 36,
                              color: AppColors.ligthGrey,
                              fontWeight: FontWeight.w700,
                            ),
                          ).onlyPadding(right: 12),
                          const Text(
                            "BTC",
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColors.ligthGrey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "0.00 USD",
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColors.ligthGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ).onlyPadding(top: 40).expanded(),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(24, 14, 0, 15),
                  height: 62,
                  color: AppColors.green,
                  child: Row(
                    children: [
                      Image.asset(
                        AppIcons.send,
                        height: 34,
                      ),
                      const Text(
                        "Send",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white),
                      ).onlyPadding(left: 10),
                    ],
                  ),
                ),
              ).expanded(),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(24, 14, 0, 15),
                  height: 62,
                  color: AppColors.purple,
                  child: Row(
                    children: [
                      Image.asset(
                        AppIcons.receive,
                        height: 34,
                      ),
                      const Text(
                        "Receive",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white),
                      ).onlyPadding(left: 10),
                    ],
                  ),
                ),
              ).expanded(),
            ],
          ).onlyPadding(top: 20),
          Container(
            height: 1,
            color: AppColors.darkGrey,
          ).symmetricPadding(vertical: 34),
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
                      AppIcons.transaction,
                      height: 32,
                    ),
                    const Text(
                      "Transactions (0)",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.ligthGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ).onlyPadding(left: 12),
                    const Spacer(),
                    Image.asset(
                      AppIcons.search,
                      height: 32,
                    ),
                  ],
                ),
                Center(
                  child: const Text(
                    "No trasaction history",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.ligthGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ).onlyPadding(top: 40),
                ),
              ],
            ),
          ).expanded(),
        ],
      ),
    );
  }
}
