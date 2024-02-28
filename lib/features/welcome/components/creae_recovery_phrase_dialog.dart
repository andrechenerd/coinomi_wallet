import 'package:coinomi/core/constanats/app_colors.dart';
import 'package:coinomi/core/constanats/app_icons.dart';
import 'package:coinomi/core/constanats/app_images.dart';
import 'package:coinomi/core/extensions/widget_extensions.dart';
import 'package:coinomi/core/ui_components/other/dialog_button.dart';
import 'package:coinomi/data/repositories/hive_repo.dart';
import 'package:coinomi/features/main/main_screen.dart';
import 'package:coinomi/features/welcome/cubit.dart';
import 'package:coinomi/features/welcome/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRecoveryPhraseDialog extends StatefulWidget {
  const CreateRecoveryPhraseDialog({super.key});

  @override
  State<CreateRecoveryPhraseDialog> createState() =>
      _CreateRecoveryPhraseDialogState();
}

class _CreateRecoveryPhraseDialogState
    extends State<CreateRecoveryPhraseDialog> {
  late final WelcomeCubit cubit;

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
                        "Confirm Recovery Phrase",
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
                    "Please confirm your recovery phrase by clicking the words in the right order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.darkBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ).onlyPadding(bottom: 14),
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
                                state.selectedMenmonicPhrases.length,
                                (index) => Text(
                                  state.selectedMenmonicPhrases[index],
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
                  GestureDetector(
                    onTap: () {
                      cubit.removeFromMenmonicList(
                          state.selectedMenmonicPhrases.last);
                    },
                    child: Container(
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
                    ),
                  )
                      .align(alignment: Alignment.centerRight)
                      .onlyPadding(right: 40, bottom: 24),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      ...List.generate(
                          state.menmonicPhrases.length,
                          (index) => GestureDetector(
                                onTap: () => !cubit.isContains(
                                        state.menmonicPhrases[index])
                                    ? cubit.addToMenmonicList(
                                        state.menmonicPhrases[index])
                                    : null,
                                child: Chip(
                                  backgroundColor: cubit.isContains(
                                          state.menmonicPhrases[index])
                                      ? AppColors.purple
                                      : AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: AppColors.purple, width: 1.0),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  label: Text(
                                    state.menmonicPhrases[index],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: cubit.isContains(
                                              state.menmonicPhrases[index])
                                          ? AppColors.white
                                          : AppColors.purple,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )),
                    ],
                  ).symmetricPadding(horizontal: 40).onlyPadding(bottom: 100),
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
                        text: "Skip",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ).onlyPadding(left: 20),
                      DialogButton(
                        isActive: state.selectedMenmonicPhrases.isNotEmpty,
                        text: "Confirm",
                        onTap: () {
                          if (state.selectedMenmonicPhrases.isEmpty) return;
                          final confirmed =
                              state.selectedMenmonicPhrases.join(" ");
                          final generated = state.menmonicPhrases.join(" ");
                          if (confirmed == generated) {
                            HiveRepo().setIsNotFirstAppOpen();
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const MainScreenBuilder(),
                                ),
                                (route) => false);
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
