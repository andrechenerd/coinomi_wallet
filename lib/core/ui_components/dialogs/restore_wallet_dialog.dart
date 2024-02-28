import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/constanats/app_images.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:coinomi/core/ui_components/other/dialog_button.dart';
import 'package:coinomi/data/repositories/hive_repo.dart';
import 'package:coinomi/data/repositories/wallet_repo.dart';
import 'package:flutter/material.dart';

class RestoreWalletDialog extends StatefulWidget {
  const RestoreWalletDialog({super.key, required this.onImport});
  final void Function(BuildContext) onImport;
  @override
  State<RestoreWalletDialog> createState() => _RestoreWalletDialogState();
}

class _RestoreWalletDialogState extends State<RestoreWalletDialog> {
  final ctrl = TextEditingController();
  bool isNotEmpty = false;
  @override
  Widget build(BuildContext context) {
    print(HiveRepo().savedMnemonics);
    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 1.5,
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Restore Wallet",
                  style: TextStyle(fontSize: 16, color: AppColors.darkGrey),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      AppIcons.close,
                      width: 32,
                    )),
              ],
            ).onlyPadding(left: 24, top: 12, right: 24, bottom: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: 80,
              color: AppColors.yellow,
              child: Row(
                children: [
                  Image.asset(
                    AppImages.appLogo,
                    height: 55,
                  ),
                  const Text(
                    "Coinomi is displaying sensitive information",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ).onlyPadding(left: 12),
                ],
              ),
            ),
            Container(
              height: 7,
              color: AppColors.green,
            ),
            const Spacer(
              flex: 2,
            ),
            const Text(
              "Recovery Phrase / Private key",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.darkBlack,
                fontWeight: FontWeight.w700,
              ),
            )
                .onlyPadding(bottom: 14, left: 40)
                .align(alignment: Alignment.centerLeft),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: 150,
              child: TextField(
                controller: ctrl,
                onChanged: (value) => setState(() {
                  if (ctrl.text.isEmpty) {
                    isNotEmpty = false;
                  } else {
                    isNotEmpty = true;
                  }
                }),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.green,
                ),
                maxLines: 8,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 40, vertical: 24),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              height: 1,
              color: AppColors.ligthGrey,
            ),
            Row(
              children: [
                Image.asset(
                  AppIcons.security,
                  height: 34,
                ),
                const Spacer(),
                DialogButton(
                  text: "Cancel",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ).onlyPadding(left: 20),
                DialogButton(
                  text: "Ok",
                  isActive: isNotEmpty,
                  onTap: () async {
                    final text = ctrl.text.trim();
                    if (text.split(" ").length != 12) return;
                    if (_isLoading) return;
                    _isLoading = true;
                    try {
                      await WalletRepo().importWallet(text).then((value) {
                        _isLoading = false;
                        widget.onImport(context);
                      });
                    } catch (e) {
                      _isLoading = false;
                    } finally {
                      _isLoading = false;
                    }
                  },
                ).onlyPadding(left: 20),
              ],
            ).onlyPadding(
              left: 12,
              right: 40,
              top: 18,
              bottom: 18,
            ),
          ],
        ),
      ),
    );
  }

  bool _isLoading = false;
}
