import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/constanats/app_images.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:coinomi/core/ui_components/check_box.dart';
import 'package:coinomi/core/ui_components/other/dialog_button.dart';
import 'package:coinomi/features/welcome/components/creae_recovery_phrase_dialog.dart';
import 'package:coinomi/features/welcome/cubit.dart';
import 'package:coinomi/features/welcome/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateWalletDialog extends StatefulWidget {
  const CreateWalletDialog({super.key});

  @override
  State<CreateWalletDialog> createState() => _CreateWalletDialogState();
}

class _CreateWalletDialogState extends State<CreateWalletDialog> {
  late final WelcomeCubit cubit;
  bool isChecked = false;

  @override
  void initState() {
    cubit = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeCubit, WelcomeState>(
        bloc: cubit,
        builder: (context, state) {
          return Dialog(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Create Wallet",
                        style:
                            TextStyle(fontSize: 16, color: AppColors.darkGrey),
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
                          "Confirm Recovery Phrase",
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
                  ).onlyPadding(bottom: 40),
                  const Text(
                    "Please write it down on paper and keep it in a safe, offline place. Never share your recovery phrase with anyone, and never it in any online website or service",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.darkBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ).onlyPadding(bottom: 14, left: 40, right: 40),
                  const Text(
                    "If you lose your recovery phrase, your wllet cannot be recovered!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.orange,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                      .onlyPadding(bottom: 14, left: 40)
                      .align(alignment: Alignment.centerLeft),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.center,
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.darkGrey)),
                    child: state.isLoading
                        ? const CircularProgressIndicator(
                            color: AppColors.purple,
                          )
                        : Wrap(
                            spacing: 8,
                            alignment: WrapAlignment.center,
                            children: [
                              ...List.generate(
                                state.menmonicPhrases.length,
                                (index) => Text(
                                  state.menmonicPhrases[index],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ).onlyPadding(bottom: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(
                              text: state.selectedMenmonicPhrases.join(' ')));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 38,
                          width: 109,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.white,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AppIcons.copy,
                                width: 34,
                              ),
                              const Text(
                                "Copy",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.ligthGrey,
                                ),
                              ).onlyPadding(left: 12),
                            ],
                          ),
                        ),
                      )
                          .align(alignment: Alignment.centerRight)
                          .onlyPadding(right: 40, bottom: 24),
                      Container(
                        alignment: Alignment.center,
                        height: 38,
                        width: 109,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.ligthGrey,
                        ),
                        child: const Text(
                          "Remove",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                        ).symmetricPadding(horizontal: 24),
                      )
                          .align(alignment: Alignment.centerRight)
                          .onlyPadding(right: 40, bottom: 24),
                    ],
                  ),
                  Row(
                    children: [
                      CheckboxWidget(
                        isChecked: state.isChecked,
                        onTap: () => cubit.isChecked(),
                      ),
                      const Text(
                        "I have safely stored my recovery phrase.",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.darkBlack,
                          fontWeight: FontWeight.w700,
                        ),
                      ).onlyPadding(left: 10),
                    ],
                  ).onlyPadding(left: 40, bottom: 40),
                  // const Spacer(),
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
                        isActive: state.isChecked,
                        text: "Next",
                        onTap: () {
                          if(state.isChecked) {
                            showDialog(context: context, builder: (context) => BlocProvider.value(value: cubit,child: const CreateRecoveryPhraseDialog()),);
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
        });
  }
}
