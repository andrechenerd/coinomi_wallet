import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:coinomi/data/repositories/wallet_repo.dart';
import 'package:coinomi/features/main/views/overview/components/crypto_widget.dart';
import 'package:flutter/material.dart';
import 'components/balance_widget.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Text(
            "Overview",
            style: TextStyle(
              fontSize: 36,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ).align(alignment: Alignment.centerLeft),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 254,
                  width: 254,
                  child: Image.asset("assets/images/Ellipse 22.png"),
                ),
              ),
              const Spacer(),
              BalanceWidget(
                      balance: WalletRepo().lastWallet == null
                          ? 0
                          : WalletRepo().lastWallet!.countedMoneyInDollars)
                  .expanded(flex: 4)
            ],
          ).symmetricPadding(vertical: 40),
          Container(
            height: 1,
            color: AppColors.ligthGrey,
          ).onlyPadding(bottom: 30),
          const CryptoWidget(
              imagePath: "assets/images/Coin_icon.png",
              priceDollar: 4.43434,
              priceCrypto: 0.12,
              procent: 33,
              color: Colors.orange,
              coinName: "Bitcoin",
              coinShortName: "BTC"),
        ],
      ),
    );
  }
}
